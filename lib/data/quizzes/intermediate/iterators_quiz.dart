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
];