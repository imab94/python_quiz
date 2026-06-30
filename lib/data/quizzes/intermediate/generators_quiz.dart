import 'package:python_quiz/models/quiz_question.dart';

const generatorsQuiz = [
  QuizQuestion(
    'Which keyword is used inside a generator?',
    [
      'yield',
      'return',
      'break',
      'continue',
    ],
  ),

  QuizQuestion(
    'Generators produce values...',
    [
      'One at a time',
      'All at once',
      'In reverse order',
      'Randomly',
    ],
  ),

  QuizQuestion(
    'Why are generators memory efficient?',
    [
      'They generate values lazily',
      'They compress data',
      'They remove duplicates',
      'They use recursion',
    ],
  ),

  QuizQuestion(
    'A generator object can be iterated using...',
    [
      'for loop',
      'if statement',
      'switch statement',
      'class',
    ],
  ),

  QuizQuestion(
    'What happens when a generator reaches the end?',
    [
      'StopIteration is raised',
      'It restarts automatically',
      'It throws SyntaxError',
      'Nothing happens',
    ],
  ),
  QuizQuestion(
    'Which function creates an iterator from a generator?',
    [
      'iter()',
      'list()',
      'tuple()',
      'dict()',
    ],
  ),

  QuizQuestion(
    'Which built-in function retrieves the next value from a generator?',
    [
      'next()',
      'yield()',
      'iter()',
      'range()',
    ],
  ),

  QuizQuestion(
    'Can a generator be iterated more than once after it is exhausted?',
    [
      'No',
      'Yes',
      'Only with a while loop',
      'Only after using next()',
    ],
  ),

  QuizQuestion(
    'What does a generator function return?',
    [
      'A generator object',
      'A list',
      'A tuple',
      'A dictionary',
    ],
  ),
];