import 'package:python_quiz/models/quiz_question.dart';

const contextManagersQuiz = [
  QuizQuestion(
    'Which keyword is used with context managers?',
    [
      'with',
      'using',
      'context',
      'manage',
    ],
  ),
  QuizQuestion(
    'Context managers are mainly used for...',
    [
      'Automatic resource management',
      'Creating classes',
      'Loops',
      'Exception creation',
    ],
  ),
  QuizQuestion(
    'Which method runs when entering a context?',
    [
      '__enter__',
      '__start__',
      '__init__',
      '__begin__',
    ],
  ),
  QuizQuestion(
    'Which method runs while exiting a context?',
    [
      '__exit__',
      '__leave__',
      '__close__',
      '__end__',
    ],
  ),
  QuizQuestion(
    'Using with automatically...',
    [
      'Closes resources',
      'Creates threads',
      'Imports modules',
      'Deletes variables',
    ],
  ),
  QuizQuestion(
    'Which resource is most commonly managed using the with statement?',
    [
      'Files',
      'Loops',
      'Variables',
      'Lists',
    ],
  ),

  QuizQuestion(
    'What is the main benefit of using a context manager?',
    [
      'Resources are cleaned up automatically',
      'Programs execute faster',
      'Memory usage becomes zero',
      'It replaces exception handling',
    ],
  ),

  QuizQuestion(
    'What will this code do?\n\n'
        'with open("data.txt", "r") as file:\n'
        '    content = file.read()',
    [
      'Open and automatically close the file',
      'Delete the file',
      'Keep the file open permanently',
      'Raise a SyntaxError',
    ],
  ),

  QuizQuestion(
    'Can a context manager be used with exception handling?',
    [
      'Yes',
      'No',
      'Only with loops',
      'Only with generators',
    ],
  ),

  QuizQuestion(
    'What does the "as" keyword do in a with statement?',
    [
      'Assigns the managed resource to a variable',
      'Creates a new class',
      'Imports a module',
      'Starts a new thread',
    ],
  ),
];