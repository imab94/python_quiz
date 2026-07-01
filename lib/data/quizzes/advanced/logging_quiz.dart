import 'package:python_quiz/models/quiz_question.dart';

const loggingQuiz = [
  QuizQuestion(
    'Which module is used for logging?',
    [
      'logging',
      'logger',
      'log',
      'debug',
    ],
  ),
  QuizQuestion(
    'Which logging level is the lowest?',
    [
      'DEBUG',
      'ERROR',
      'WARNING',
      'CRITICAL',
    ],
  ),
  QuizQuestion(
    'Which logging level indicates serious failures?',
    [
      'CRITICAL',
      'INFO',
      'DEBUG',
      'WARNING',
    ],
  ),
  QuizQuestion(
    'Logging is preferred over...',
    [
      'print()',
      'Classes',
      'Loops',
      'Exceptions',
    ],
  ),
  QuizQuestion(
    'Logs help in...',
    [
      'Debugging applications',
      'Compiling faster',
      'Reducing memory',
      'Creating variables',
    ],
  ),
  QuizQuestion(
    'Which logging level is commonly used for general application information?',
    [
      'INFO',
      'DEBUG',
      'ERROR',
      'CRITICAL',
    ],
  ),

  QuizQuestion(
    'Which logging level indicates a potential problem but not an error?',
    [
      'WARNING',
      'DEBUG',
      'INFO',
      'CRITICAL',
    ],
  ),

  QuizQuestion(
    'Which logging level is used when an operation fails?',
    [
      'ERROR',
      'DEBUG',
      'INFO',
      'WARNING',
    ],
  ),

  QuizQuestion(
    'Which function logs a debug message?',
    [
      'logging.debug()',
      'logging.print()',
      'logging.log()',
      'logging.trace()',
    ],
  ),

  QuizQuestion(
    'What will this code output?\n\n'
        'import logging\n'
        'logging.basicConfig(level=logging.INFO)\n'
        'logging.info("App started")',
    [
      'An INFO log message',
      'A SyntaxError',
      'Nothing',
      'The program exits',
    ],
  ),

  QuizQuestion(
    'Why is logging better than print() for applications?',
    [
      'It supports log levels and better debugging',
      'It always executes faster',
      'It reduces memory usage',
      'It replaces exception handling',
    ],
  ),

  QuizQuestion(
    'Which function is commonly used to configure the logging system?',
    [
      'logging.basicConfig()',
      'logging.setup()',
      'logging.config()',
      'logging.init()',
    ],
  ),

  QuizQuestion(
    'Which logging level is typically used to record detailed troubleshooting information?',
    [
      'DEBUG',
      'INFO',
      'WARNING',
      'ERROR',
    ],
  ),
];