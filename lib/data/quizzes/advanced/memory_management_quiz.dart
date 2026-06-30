import 'package:python_quiz/models/quiz_question.dart';

const memoryManagementQuiz = [
  QuizQuestion(
    'Python automatically manages...',
    [
      'Memory',
      'CPU',
      'Network',
      'Threads',
    ],
  ),
  QuizQuestion(
    'Unused objects are removed by...',
    [
      'Garbage Collector',
      'Compiler',
      'Interpreter',
      'Decorator',
    ],
  ),
  QuizQuestion(
    'Which module controls garbage collection?',
    [
      'gc',
      'memory',
      'sys',
      'os',
    ],
  ),
  QuizQuestion(
    'Reference counting tracks...',
    [
      'Object references',
      'Functions',
      'Classes',
      'Files',
    ],
  ),
  QuizQuestion(
    'Garbage collection prevents...',
    [
      'Memory leaks',
      'Syntax errors',
      'Import errors',
      'Loop errors',
    ],
  ),
  QuizQuestion(
    'What happens when an object\'s reference count becomes zero?',
    [
      'It becomes eligible for deletion',
      'It is copied',
      'It becomes read-only',
      'It is moved to another module',
    ],
  ),

  QuizQuestion(
    'Which built-in function returns the reference count of an object (with an extra temporary reference)?',
    [
      'sys.getrefcount()',
      'gc.collect()',
      'id()',
      'len()',
    ],
  ),

  QuizQuestion(
    'Which module provides the getrefcount() function?',
    [
      'sys',
      'gc',
      'os',
      'math',
    ],
  ),

  QuizQuestion(
    'Which function can be used to manually trigger garbage collection?',
    [
      'gc.collect()',
      'gc.clear()',
      'memory.clean()',
      'sys.collect()',
    ],
  ),

  QuizQuestion(
    'What does the id() function return?',
    [
      'The unique identity of an object',
      'The reference count',
      'The object type',
      'The object size',
    ],
  ),

  QuizQuestion(
    'Why does Python use garbage collection?',
    [
      'To free memory occupied by unused objects',
      'To speed up internet connections',
      'To remove syntax errors',
      'To optimize loops',
    ],
  ),

  QuizQuestion(
    'What can prevent an object from being deleted?',
    [
      'It still has active references',
      'It is inside a function',
      'It is printed',
      'It is immutable',
    ],
  ),

  QuizQuestion(
    'Which of the following is a memory management technique used by Python?',
    [
      'Reference counting',
      'Binary search',
      'Recursion',
      'Inheritance',
    ],
  ),
];