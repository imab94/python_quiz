
import builtins
import contextlib
import json
import sys
import time
import traceback


class ConsoleWriter:
    """Batch console output to avoid flooding Flutter's UI."""

    def __init__(self, bridge):
        self.bridge = bridge
        self.buffer = []
        self.buffer_size = 0
        self.last_flush = time.monotonic()

    def write(self, text):
        if not text:
            return len(text)

        if self.bridge.isCancelled():
            return len(text)

        self.buffer.append(text)
        self.buffer_size += len(text)

        now = time.monotonic()

        # Do not flush on every newline.
        if self.buffer_size >= 4096 or now - self.last_flush >= 0.05:
            self.flush()

        return len(text)

    def flush(self):
        if not self.buffer:
            return

        text = "".join(self.buffer)
        self.buffer.clear()
        self.buffer_size = 0
        self.last_flush = time.monotonic()

        if not self.bridge.isCancelled():
            self.bridge.writeOutput(text)

    def isatty(self):
        return True


def run_code(code, input_bridge):
    error = None
    writer = ConsoleWriter(input_bridge)
    previous_trace = sys.gettrace()

    def playground_input(prompt=""):
        if input_bridge.isCancelled():
            raise KeyboardInterrupt("Program stopped by user.")

        # Flutter displays the prompt in the terminal.
        input_bridge.writeOutput(str(prompt))

        value = input_bridge.readLine(str(prompt))

        if value is None or input_bridge.isCancelled():
            raise KeyboardInterrupt("Program stopped by user.")

        # Flutter displays the entered value.
        input_bridge.writeOutput(value + "\n")
        return value

    safe_builtins = dict(vars(builtins))
    safe_builtins["input"] = playground_input

    namespace = {
        "__name__": "__main__",
        "__builtins__": safe_builtins,
    }

    def cancellation_trace(frame, event, arg):
        if input_bridge.isCancelled():
            raise KeyboardInterrupt("Program stopped by user.")
        return cancellation_trace

    try:
        compiled = compile(code, "<playground>", "exec")

        with contextlib.redirect_stdout(writer):
            with contextlib.redirect_stderr(writer):
                sys.settrace(cancellation_trace)
                try:
                    exec(compiled, namespace)
                finally:
                    sys.settrace(previous_trace)
                    writer.flush()

    except KeyboardInterrupt:
        error = "Program stopped by user."

    except BaseException:
        error = traceback.format_exc()

    finally:
        sys.settrace(previous_trace)
        writer.flush()

    return json.dumps({
        "output": "",
        "error": error,
    })
