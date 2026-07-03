import 'package:python_quiz/data/quizzes/advanced/logging_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const loggingTopic = Topic(
  title: "Logging",
  level: "Advanced",
  priority: 24,
  isRecommended: true,
  recommendationReason: "Track application behavior and debug issues faster.",
  sections: [
    TopicSection(
      title: "What is Logging?",
      content: """
Logging is the process of recording information about a program while it is running.

Instead of displaying messages only on the screen, logging allows applications to save useful information such as events, warnings, errors, and debugging details.

Python provides a built-in logging module that makes it easy to record these messages.

Logs help developers understand what happened inside a program, diagnose problems, monitor applications, and troubleshoot unexpected behavior.

Almost every professional Python application uses logging because it provides valuable information without interrupting normal program execution.
""",
    ),

    TopicSection(
      title: "Why Do We Need Logging?",
      content: """
Imagine a program running on a server for several months.

If an error occurs, simply printing messages on the screen is not useful because nobody may be watching the console.

Logging solves this problem by storing important information in log files.

Developers can later examine these logs to understand:

• What happened.
• When it happened.
• Which part of the program caused the issue.
• How often the problem occurs.

Logging is an essential tool for maintaining reliable software.
""",
    ),

    TopicSection(
      title: "Logging vs print()",
      content: """
Many beginners use print() to display information while learning Python.

Although print() is useful for simple programs, it is not suitable for professional applications.

print()

• Displays messages only on the console.
• Messages disappear after the program ends.
• Cannot categorize messages.
• Difficult to manage in large applications.

----------------------------------------

Logging

• Saves messages permanently.
• Supports multiple severity levels.
• Can write to files or other destinations.
• Can include timestamps.
• Can be configured easily.

For real-world software, logging is preferred over print().
""",
    ),

    TopicSection(
      title: "The logging Module",
      content: """
Python includes a built-in module named logging.

There is no need to install any external package.

After importing the module, you can immediately start recording log messages.

The logging module provides functions for different message levels and allows developers to control where logs are stored and how they are displayed.
""",
      syntax: """
import logging
""",
      exampleCode: """
import logging

logging.warning("This is a warning.")
""",
      output: """
WARNING:root:This is a warning.
""",
    ),

    TopicSection(
      title: "Logging Levels",
      content: """
Every log message has a severity level.

Python provides five commonly used logging levels.

DEBUG

Detailed information useful while debugging.

----------------------------------------

INFO

General information about normal program execution.

----------------------------------------

WARNING

Something unexpected happened, but the program can continue.

----------------------------------------

ERROR

A serious problem occurred that affected part of the program.

----------------------------------------

CRITICAL

A very serious error that may stop the application completely.

Choosing the correct logging level makes log files much easier to understand.
""",
    ),

    TopicSection(
      title: "Creating Log Messages",
      content: """
The logging module provides separate functions for each logging level.

Each function records a message with its corresponding severity.

Developers should choose the appropriate level depending on the importance of the information being recorded.
""",
      syntax: """
logging.debug(message)

logging.info(message)

logging.warning(message)

logging.error(message)

logging.critical(message)
""",
      exampleCode: """
import logging

logging.debug("Debug message")
logging.info("Information")
logging.warning("Warning")
logging.error("Error")
logging.critical("Critical error")
""",
      output: """
WARNING:root:Warning
ERROR:root:Error
CRITICAL:root:Critical error
""",
    ),

    TopicSection(
      title: "Default Logging Behavior",
      content: """
By default, Python only displays log messages with a severity level of WARNING or higher.

This means DEBUG and INFO messages are ignored unless the logging configuration is changed.

This default behavior helps reduce unnecessary output while still displaying important warnings and errors.

Developers can customize this behavior using the basicConfig() function, which will be discussed in the next section.
""",
    ),
    TopicSection(
      title: "Configuring Logging with basicConfig()",
      content: """
The basicConfig() function is used to configure Python's logging system.

It allows developers to control:

• The minimum logging level.
• The format of log messages.
• The destination of log messages.
• The log file name.
• Whether logs are appended or overwritten.

The basicConfig() function should usually be called once at the beginning of a program before any log messages are generated.
""",
      syntax: """
import logging

logging.basicConfig(
    level=logging.INFO
)
""",
      exampleCode: """
import logging

logging.basicConfig(level=logging.INFO)

logging.debug("Debug message")
logging.info("Application started")
logging.warning("Low disk space")
""",
      output: """
INFO:root:Application started
WARNING:root:Low disk space
""",
    ),

    TopicSection(
      title: "Logging to a File",
      content: """
Instead of displaying log messages on the console, Python can save them to a file.

This allows developers to review application activity even after the program has finished running.

Log files are especially useful for:

• Servers
• Desktop applications
• Web applications
• Long-running programs

If the specified file does not exist, Python automatically creates it.
""",
      syntax: """
logging.basicConfig(
    filename="app.log"
)
""",
      exampleCode: """
import logging

logging.basicConfig(
    filename="app.log",
    level=logging.INFO
)

logging.info("Application started")
logging.warning("Disk space is low")
""",
    ),

    TopicSection(
      title: "Formatting Log Messages",
      content: """
By default, log messages have a simple format.

Python allows developers to customize the appearance of every log entry.

Common information included in log messages:

• Time
• Logging level
• Logger name
• Message

A well-formatted log makes debugging much easier because important information is available immediately.
""",
      syntax: """
logging.basicConfig(
    format="..."
)
""",
      exampleCode: """
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s: %(message)s"
)

logging.info("Application started")
logging.error("File not found")
""",
      output: """
INFO: Application started
ERROR: File not found
""",
    ),

    TopicSection(
      title: "Using Timestamps",
      content: """
Knowing when an event occurred is extremely important.

Python can automatically include timestamps in every log message.

This helps developers determine:

• When an error occurred.
• How long an operation took.
• The order of events.

Timestamps are commonly included in production applications.
""",
      syntax: """
%(asctime)s
""",
      exampleCode: """
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

logging.info("Application started")
""",
      output: """
2026-01-01 10:00:00,000 - INFO - Application started
""",
    ),

    TopicSection(
      title: "Logging Variables",
      content: """
Log messages often need to include variable values.

Instead of combining strings manually, the logging module supports placeholders.

Using placeholders is recommended because the logging module performs formatting only when the message is actually written.

This approach is more efficient and follows Python's recommended logging style.
""",
      exampleCode: """
import logging

logging.basicConfig(level=logging.INFO)

username = "Arun"

logging.info(
    "User %s logged in.",
    username
)
""",
      output: """
INFO:root:User Arun logged in.
""",
    ),

    TopicSection(
      title: "Logging Exceptions",
      content: """
When an exception occurs, it is often helpful to record both the error message and its traceback.

The logging module provides the exception() function for this purpose.

It should be called inside an except block.

This function automatically records:

• The exception message.
• The complete traceback.

Exception logging makes debugging much easier.
""",
      exampleCode: """
import logging

logging.basicConfig(level=logging.ERROR)

try:
    result = 10 / 0

except ZeroDivisionError:
    logging.exception("An error occurred")
""",
      output: """
ERROR:root:An error occurred
Traceback (most recent call last):
...
ZeroDivisionError: division by zero
""",
    ),

    TopicSection(
      title: "Common Log Message Examples",
      content: """
Different logging levels should be used for different situations.

DEBUG

Detailed information while debugging.

----------------------------------------

INFO

Application started successfully.

----------------------------------------

WARNING

Disk space is running low.

----------------------------------------

ERROR

Unable to open configuration file.

----------------------------------------

CRITICAL

Database connection failed. Application shutting down.

Choosing the appropriate logging level helps developers quickly identify the seriousness of an event.
""",
    ),
    TopicSection(
      title: "Custom Loggers",
      content: """
Large applications often contain many modules.

Using the default logger for every module can make log messages difficult to organize.

Python allows developers to create custom loggers using the getLogger() function.

Each logger has its own name, making it easier to identify where a log message originated.

Custom loggers are commonly used in professional applications because they improve organization and simplify debugging.
""",
      syntax: """
import logging

logger = logging.getLogger(__name__)
""",
      exampleCode: """
import logging

logging.basicConfig(level=logging.INFO)

logger = logging.getLogger(__name__)

logger.info("Application started")
""",
      output: """
INFO:__main__:Application started
""",
    ),

    TopicSection(
      title: "Handlers",
      content: """
Handlers determine where log messages are sent.

Instead of sending every log message to the console, handlers allow logs to be written to different destinations.

Common handlers include:

• StreamHandler (Console)
• FileHandler (Log files)
• RotatingFileHandler
• SMTPHandler (Email)
• HTTPHandler

A single logger can use multiple handlers at the same time.

For example, an application can display logs on the console while also saving them to a file.
""",
    ),

    TopicSection(
      title: "Formatters",
      content: """
A formatter controls the appearance of log messages.

Instead of using Python's default format, developers can define their own layout.

A formatter can include:

• Timestamp
• Logger name
• Logging level
• File name
• Function name
• Message

Well-formatted logs are much easier to read and analyze.
""",
      syntax: """
logging.Formatter(
    format
)
""",
    ),

    TopicSection(
      title: "Log Rotation",
      content: """
Applications that run continuously can generate very large log files.

Log rotation automatically creates new log files after the current file reaches a certain size or age.

Benefits of log rotation include:

• Prevents log files from becoming too large.
• Improves disk space management.
• Makes logs easier to organize.
• Simplifies backup and maintenance.

Python provides RotatingFileHandler and TimedRotatingFileHandler for automatic log rotation.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while using logging.

• Use logging instead of print() in production applications.
• Choose the correct logging level.
• Configure logging only once.
• Include timestamps in log messages.
• Use meaningful log messages.
• Never log sensitive information such as passwords or API keys.
• Create custom loggers for large applications.
• Store logs in files for production environments.
• Rotate large log files automatically.

Following these practices makes applications easier to monitor and maintain.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates a simple logging configuration that records messages with different severity levels.
""",
      exampleCode: """
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s: %(message)s"
)

logging.info("Application started")
logging.warning("Disk space is low")
logging.error("File not found")
""",
      output: """
INFO: Application started
WARNING: Disk space is low
ERROR: File not found
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned how professional Python applications record information using the logging module.

You learned:

• What logging is.
• Why logging is important.
• Logging vs print().
• Logging levels.
• The logging module.
• Creating log messages.
• Configuring logging with basicConfig().
• Logging to files.
• Formatting log messages.
• Using timestamps.
• Logging variables.
• Logging exceptions.
• Custom loggers.
• Handlers.
• Formatters.
• Log rotation.
• Best practices.

Logging is one of the most important tools for monitoring, debugging, and maintaining Python applications. Well-designed logging helps developers quickly identify problems, understand application behavior, and build reliable software.
""",
    ),
  ],
  quizQuestions: loggingQuiz,
);