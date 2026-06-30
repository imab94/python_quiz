import 'package:python_quiz/models/quiz_question.dart';

const questions = [
  // Easy Questions
  QuizQuestion(
    'Which keyword is used to define a function in Python?',
    [
      'def',
      'func',
      'function',
      'define',
    ],
  ),
  QuizQuestion(
    'Which data type is used to store True or False values in Python?',
    [
      'bool',
      'boolean',
      'int',
      'str',
    ],
  ),
  QuizQuestion(
    'Which symbol is used for comments in Python?',
    [
      '#',
      '//',
      '/* */',
      '--',
    ],
  ),
  // Medium Questions
  QuizQuestion(
    'What is the output of print(type([1, 2, 3]))?',
    [
      '<class \'list\'>',
      '<class \'tuple\'>',
      '<class \'set\'>',
      '<class \'dict\'>',
    ],
  ),
  QuizQuestion(
    'Which keyword is used to handle exceptions in Python?',
    [
      'try',
      'catch',
      'throws',
      'handle',
    ],
  ),
  QuizQuestion(
    'What does the len() function return?',
    [
      'The number of items in an object',
      'The memory size of an object',
      'The datatype of an object',
      'The last item of an object',
    ],
  ),
  QuizQuestion(
    'Which collection stores unique elements only?',
    [
      'set',
      'list',
      'tuple',
      'dictionary',
    ],
  ),
  // Hard Questions
  QuizQuestion(
    'What is the output of: print(3 * "Hi")?',
    [
      'HiHiHi',
      'Hi 3 times',
      'Error',
      '3Hi',
    ],
  ),
  QuizQuestion(
    'What is the purpose of the __init__ method in Python?',
    [
      'To initialize object attributes',
      'To destroy an object',
      'To create a module',
      'To import packages',
    ],
  ),
  QuizQuestion(
    'Which statement about Python generators is correct?',
    [
      'They produce values lazily using yield',
      'They store all values in memory',
      'They can only return integers',
      'They cannot be iterated over',
    ],
  ),
];