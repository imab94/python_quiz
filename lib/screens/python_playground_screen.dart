
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PythonPlaygroundScreen extends StatefulWidget {
  const PythonPlaygroundScreen({super.key});

  @override
  State<PythonPlaygroundScreen> createState() =>
      _PythonPlaygroundScreenState();
}

class _PythonPlaygroundScreenState
    extends State<PythonPlaygroundScreen> {
  static const MethodChannel _pythonChannel = MethodChannel(
    'com.arunbhardwaj.adv_basics/python_playground',
  );

  bool _isRunning = false;

  final TextEditingController _codeController =
  TextEditingController(
    text: 'print("Hello, World!")\n',
  );

  final TextEditingController _consoleController =
  TextEditingController();

  final TextEditingController _inputController =
  TextEditingController();

  final FocusNode _inputFocus = FocusNode();

  String? _pendingRequestId;

  String _consoleError = '';

  // Tracks the current prompt so typed input appears on the same line.
  int? _promptStart;

  final FocusNode _editorFocus = FocusNode();

  String _theme = 'Dark';
  double _fontSize = 16;
  int _tabSpaces = 4;
  final bool _showLineNumbers = true;

  static const Color _background = Color(0xFF10111A);
  static const Color _panel = Color(0xFF191B2A);
  static const Color _purple = Color(0xFF9B7BFF);

  @override
  void initState() {
    super.initState();
    _pythonChannel.setMethodCallHandler(_handlePythonInput);
  }

  Future<void> _handlePythonInput(MethodCall call) async {
    if (!mounted) return;

    if (call.method == 'pythonOutput') {
      final args = Map<String, dynamic>.from(
        call.arguments as Map,
      );
      final text = args['text'] as String? ?? '';

      if (text.isNotEmpty) {
        const maxConsoleChars = 50000;

        setState(() {
          final updated = _consoleController.text + text;

          _consoleController.text = updated.length > maxConsoleChars
              ? updated.substring(updated.length - maxConsoleChars)
              : updated;

          _consoleController.selection = TextSelection.collapsed(
            offset: _consoleController.text.length,
          );
        });
      }
      return;
    }

    if (call.method == 'requestInput') {
      final args = Map<String, dynamic>.from(
        call.arguments as Map,
      );

      final requestId = args['requestId'] as String?;
      final prompt = args['prompt'] as String? ?? '';

      if (requestId == null) return;

      setState(() {
        _pendingRequestId = requestId;
        _inputController.clear();

        // Display the prompt once. The Python runner doesn't print it.
        _consoleController.text += prompt;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _pendingRequestId == requestId) {
          _inputFocus.requestFocus();
        }
      });
      return;
    }

    throw MissingPluginException(
      'Unknown Python bridge method: ${call.method}',
    );
  }

  Future<void> _stopCode() async {
    if (!_isRunning) return;

    try {
      await _pythonChannel.invokeMethod<void>('stopPython');

      if (!mounted) return;

      setState(() {
        _pendingRequestId = null;
        _inputController.clear();
        _consoleController.text += '\nStopping program...\n';
      });
    } on PlatformException catch (e) {
      if (!mounted) return;

      setState(() {
        _consoleController.text +=
        '\nStop error: ${e.message ?? e.code}\n';
      });
    }
  }

  Future<void> _submitConsoleInput() async {
    final requestId = _pendingRequestId;
    if (requestId == null) return;

    final value = _inputController.text;

    setState(() {
      // Display the entered value after the prompt.
      _consoleController.text += '$value\n';
      _pendingRequestId = null;
      _inputController.clear();
    });

    try {
      await _pythonChannel.invokeMethod<void>(
        'submitInput',
        {
          'requestId': requestId,
          'value': value,
          'cancelled': false,
        },
      );
    } on PlatformException catch (e) {
      if (!mounted) return;

      setState(() {
        _consoleController.text +=
        'Input error: ${e.message ?? e.code}\n';
      });
    }
  }

  @override
  void dispose() {
    _pythonChannel.setMethodCallHandler(null);
    _codeController.dispose();
    _consoleController.dispose();
    _editorFocus.dispose();
    _inputController.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  Color get _editorBackground {
    switch (_theme) {
      case 'Light':
        return const Color(0xFFF5F5F7);
      case 'Monokai':
        return const Color(0xFF272822);
      default:
        return const Color(0xFF11131D);
    }
  }

  Color get _editorForeground =>
      _theme == 'Light' ? const Color(0xFF20212A) : Colors.white;

  Color get _consoleBackground {
    switch (_theme) {
      case 'Light':
        return const Color(0xFFF5F5F7);
      case 'Monokai':
        return const Color(0xFF272822);
      default:
        return const Color(0xFF191B2A);
    }
  }

  Color get _consoleForeground {
    return _theme == 'Light'
        ? const Color(0xFF20212A)
        : const Color(0xFFB8F5C6);
  }

  Color get _consoleHeaderBackground {
    switch (_theme) {
      case 'Light':
        return const Color(0xFFE2E4EB);
      case 'Monokai':
        return const Color(0xFF3E3D32);
      default:
        return const Color(0xFF222437);
    }
  }

  Color get _consoleHintColor {
    return _theme == 'Light'
        ? Colors.black45
        : Colors.white38;
  }

  Future<void> _runCode() async {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
      _pendingRequestId = null;
      _consoleController.clear();
      _inputController.clear();
      _consoleError = '';
    });

    try {
      final result =
      await _pythonChannel.invokeMapMethod<String, dynamic>(
        'runPython',
        {'code': _codeController.text},
      );

      if (!mounted) return;

      final error = result?['error']?.toString();

      setState(() {
        if (error != null && error.isNotEmpty && error != 'null') {
          if (error == 'Program stopped by user.') {
            _consoleError =
            '\nKeyboardInterrupt: Program interrupted by user.\n';
          } else {
            _consoleError = '\n$error\n';
          }
        } else if (_consoleController.text.isEmpty) {
          _consoleController.text =
          'Code executed successfully. No output.';
        }
      });
    } on MissingPluginException {
      if (!mounted) return;

      setState(() {
        _consoleController.text =
        'Python bridge not found. Stop the app completely and run it again.';
      });
    } on PlatformException catch (e) {
      if (!mounted) return;

      setState(() {
        _consoleController.text =
        'Python error: ${e.message ?? e.code}';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _consoleController.text = 'Unexpected error: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isRunning = false;
          _pendingRequestId = null;
        });
      }
    }
  }

  void _clearCode() {
    _codeController.clear();
    _editorFocus.requestFocus();
  }

  void _clearConsole() {
    setState(() {
      _consoleController.clear();
      _consoleError = '';
      _promptStart = null;
    });
  }

  void _insertTab() {
    final text = _codeController.text;
    final selection = _codeController.selection;
    final spaces = ' ' * _tabSpaces;

    if (!selection.isValid) {
      _codeController.text = '$text$spaces';
      _codeController.selection = TextSelection.collapsed(
        offset: _codeController.text.length,
      );
      return;
    }

    final start = selection.start;
    final end = selection.end;
    final updated = text.replaceRange(start, end, spaces);

    _codeController.value = TextEditingValue(
      text: updated,
      selection: TextSelection.collapsed(
        offset: start + spaces.length,
      ),
    );
  }

  void _insertSample() {
    _codeController.text =
    'name = "Python Learner"\n'
        'for i in range(1, 6):\n'
        '    print(f"{i}. Hello, {name}!")\n';

    _codeController.selection = TextSelection.collapsed(
      offset: _codeController.text.length,
    );

    _editorFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _panel,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.code_rounded, color: _purple),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                'Python Compiler',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Editor theme',
            icon: const Icon(Icons.palette_outlined),
            onSelected: (value) => setState(() => _theme = value),
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'Dark', child: Text('Dark')),
              PopupMenuItem(value: 'Light', child: Text('Light')),
              PopupMenuItem(value: 'Monokai', child: Text('Monokai')),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildToolbar(),
            _buildEditorHeader(),
            Expanded(child: _buildEditor()),
            _buildConsoleHeader(),

            SizedBox(
              height: 210,
              child: Container(
                width: double.infinity,
                color: _consoleBackground,
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          reverse: true,
                          child: SelectableText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: _consoleController.text,
                                  style: TextStyle(
                                    color: _consoleForeground,
                                    fontFamily: 'monospace',
                                    fontSize: 13,
                                    height: 1.4,
                                  ),
                                ),
                                if (_consoleError.isNotEmpty)
                                  TextSpan(
                                    text: _consoleError,
                                    style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontFamily: 'monospace',
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Input field appears only when Python input() is waiting.
                    if (_pendingRequestId != null) ...[
                      const Divider(
                        color: Colors.white24,
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.lightGreenAccent,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _inputController,
                              focusNode: _inputFocus,
                              style: TextStyle(
                                color: _consoleForeground,
                                fontFamily: 'monospace',
                                fontSize: 14,
                              ),
                              textInputAction: TextInputAction.send,
                              onSubmitted: (_) => _submitConsoleInput(),
                              decoration: InputDecoration(
                                hintText: 'Type input and press Enter',
                                hintStyle: TextStyle(
                                  color: _consoleHintColor,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _submitConsoleInput,
                            icon: const Icon(
                              Icons.send_rounded,
                              color: Colors.lightGreenAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      color: _panel,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          FilledButton.icon(
            onPressed: _isRunning ? null : _runCode,
            icon: _isRunning
                ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
                : const Icon(Icons.play_arrow_rounded),
            label: Text(_isRunning ? 'Running...' : 'Run'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
            ),
          ),
          IconButton(
            tooltip: 'Stop Python execution',
            onPressed: _isRunning ? _stopCode : null,
            icon: const Icon(
              Icons.stop_circle_rounded,
              size: 28,
              color: Colors.redAccent,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.redAccent.withValues(alpha: 0.12),
              disabledForegroundColor: Colors.white24,
            ),
          ),
          IconButton(
            tooltip: 'Decrease font size',
            onPressed: () => setState(
                  () => _fontSize =
                  (_fontSize - 1).clamp(10, 30).toDouble(),
            ),
            icon: const Icon(Icons.remove, color: Colors.white),
          ),
          Text(
            '${_fontSize.round()} px',
            style: const TextStyle(color: Colors.white70),
          ),
          IconButton(
            tooltip: 'Increase font size',
            onPressed: () => setState(
                  () => _fontSize =
                  (_fontSize + 1).clamp(10, 30).toDouble(),
            ),
            icon: const Icon(Icons.add, color: Colors.white),
          ),
          PopupMenuButton<int>(
            tooltip: 'TAB indentation',
            initialValue: _tabSpaces,
            onSelected: (value) => setState(() => _tabSpaces = value),
            itemBuilder: (_) => const [
              PopupMenuItem(value: 1, child: Text('TAB = 1 space')),
              PopupMenuItem(value: 2, child: Text('TAB = 2 spaces')),
              PopupMenuItem(value: 4, child: Text('TAB = 4 spaces')),
            ],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.format_indent_increase,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 4),
                  Text('TAB', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
          IconButton(
            tooltip: 'Load sample code',
            onPressed: _insertSample,
            icon: const Icon(Icons.lightbulb_outline, color: Colors.amber),
          ),
          IconButton(
            tooltip: 'Clear editor',
            onPressed: _clearCode,
            icon: const Icon(Icons.delete_outline, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildEditorHeader() {
    return Container(
      color: _editorBackground,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          const Icon(
            Icons.description_outlined,
            color: Colors.lightBlueAccent,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            'main.py',
            style: TextStyle(
              color: _editorForeground,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            'Python 3',
            style: TextStyle(
              color: _editorForeground.withValues(alpha: .55),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditor() {
    return Container(
      color: _editorBackground,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_showLineNumbers)
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _codeController,
              builder: (context, value, _) {
                final count = '\n'.allMatches(value.text).length + 1;

                return Padding(
                  padding: const EdgeInsets.only(right: 12, top: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      count,
                          (index) => Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: _editorForeground.withValues(alpha: .35),
                          fontSize: _fontSize,
                          height: 1.5,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          Expanded(
            child: Shortcuts(
              shortcuts: const {
                SingleActivator(LogicalKeyboardKey.tab): _InsertTabIntent(),
              },
              child: Actions(
                actions: {
                  _InsertTabIntent: CallbackAction<_InsertTabIntent>(
                    onInvoke: (_) {
                      _insertTab();
                      return null;
                    },
                  ),
                },
                child: TextField(
                  controller: _codeController,
                  focusNode: _editorFocus,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  expands: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: TextStyle(
                    color: _editorForeground,
                    fontSize: _fontSize,
                    height: 1.5,
                    fontFamily: 'monospace',
                  ),
                  cursorColor: _purple,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your Python code here...',
                    hintStyle: TextStyle(
                      color: _editorForeground.withValues(alpha: .4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsoleHeader() {
    return Container(
      color: _consoleHeaderBackground,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          const Icon(
            Icons.terminal,
            color: Colors.lightGreenAccent,
            size: 19,
          ),
          const SizedBox(width: 8),
          const Text(
            'CONSOLE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Clear console',
            visualDensity: VisualDensity.compact,
            onPressed: _clearConsole,
            icon: const Icon(
              Icons.delete_sweep_outlined,
              color: Colors.white70,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsertTabIntent extends Intent {
  const _InsertTabIntent();
}
