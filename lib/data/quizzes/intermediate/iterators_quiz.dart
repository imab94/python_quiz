import 'package:python_quiz/models/quiz_question.dart';

const iteratorsQuiz = [
  QuizQuestion(
    'An iterator is an object that...',
    [
      'Returns one element at a time',
      'Stores only integers',
      'Creates functions',
      'Handles exceptions',
    ],
  ),

  QuizQuestion(
    'Which function returns an iterator?',
    [
      'iter()',
      'next()',
      'yield()',
      'range()',
    ],
  ),

  QuizQuestion(
    'Which function retrieves the next value from an iterator?',
    [
      'next()',
      'iter()',
      'yield()',
      'enumerate()',
    ],
  ),

  QuizQuestion(
    'What exception is raised when an iterator has no more elements?',
    [
      'StopIteration',
      'IndexError',
      'ValueError',
      'RuntimeError',
    ],
  ),

  QuizQuestion(
    'Which statement is true about iterators?',
    [
      'Every generator is an iterator',
      'Every iterator is a generator',
      'Iterators cannot be used in loops',
      'Iterators always return lists',
    ],
  ),
  QuizQuestion(
    'Which loop automatically uses an iterator internally?',
    [
      'for loop',
      'while loop',
      'if statement',
      'switch statement',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'nums = iter([10, 20, 30])\n'
        'print(next(nums))',
    [
      '10',
      '20',
      '30',
      'Error',
    ],
  ),

  QuizQuestion(
    'What will the second call to next() return?\n\n'
        'nums = iter([1, 2, 3])\n'
        'next(nums)\n'
        'print(next(nums))',
    [
      '2',
      '1',
      '3',
      'StopIteration',
    ],
  ),

  QuizQuestion(
    'What does iter() do when given a list?',
    [
      'Creates an iterator for the list',
      'Sorts the list',
      'Converts the list into a tuple',
      'Returns the last element',
    ],
  ),

  QuizQuestion(
    'Can an exhausted iterator be reused from the beginning?',
    [
      'No',
      'Yes',
      'Only with next()',
      'Only with a while loop',
    ],
  ),

  QuizQuestion(
    'What is the main advantage of using iterators?',
    [
      'They process data one item at a time',
      'They always execute faster than lists',
      'They automatically sort data',
      'They remove duplicate values',
    ],
  ),
];