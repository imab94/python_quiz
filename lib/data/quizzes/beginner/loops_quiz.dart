import 'package:python_quiz/models/quiz_question.dart';

const loopsQuiz = [
  QuizQuestion(
    'Which loop iterates over a sequence?',
    [
      'for',
      'while',
      'loop',
      'repeat',
    ],
  ),

  QuizQuestion(
    'Which loop executes while a condition is true?',
    [
      'while',
      'for',
      'foreach',
      'repeat',
    ],
  ),

  QuizQuestion(
    'Which keyword exits a loop immediately?',
    [
      'break',
      'continue',
      'pass',
      'return',
    ],
  ),

  QuizQuestion(
    'Which keyword skips the current iteration?',
    [
      'continue',
      'break',
      'pass',
      'exit',
    ],
  ),

  QuizQuestion(
    'Which function is commonly used with a for loop to generate numbers?',
    [
      'range()',
      'len()',
      'input()',
      'type()',
    ],
  ),
  QuizQuestion(
    'What will this code print?\n\n'
        'for i in range(3):\n'
        '    print(i)',
    [
      '0 1 2',
      '1 2 3',
      '0 1 2 3',
      '3 2 1',
    ],
  ),

  QuizQuestion(
    'How many times does this loop execute?\n\n'
        'for i in range(5):',
    [
      '5',
      '4',
      '6',
      '0',
    ],
  ),

  QuizQuestion(
    'Which keyword does nothing and acts as a placeholder?',
    [
      'pass',
      'break',
      'continue',
      'skip',
    ],
  ),

  QuizQuestion(
    'Which loop is best when the number of iterations is known?',
    [
      'for',
      'while',
      'do-while',
      'repeat',
    ],
  ),

  QuizQuestion(
    'Which loop is best when the number of iterations is unknown?',
    [
      'while',
      'for',
      'foreach',
      'repeat',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'i = 0\n'
        'while i < 3:\n'
        '    print(i)\n'
        '    i += 1',
    [
      '0 1 2',
      '1 2 3',
      '0 1 2 3',
      'Infinite loop',
    ],
  ),

  QuizQuestion(
    'What does range(2, 5) generate?',
    [
      '2, 3, 4',
      '2, 3, 4, 5',
      '1, 2, 3, 4',
      '3, 4, 5',
    ],
  ),

  QuizQuestion(
    'What happens if a while loop condition never becomes false?',
    [
      'It creates an infinite loop',
      'It raises a SyntaxError',
      'It stops automatically',
      'It runs only once',
    ],
  ),
];