import 'package:python_quiz/models/quiz_question.dart';

const asyncioQuiz = [
  QuizQuestion(
    'What is asyncio mainly used for?',
    [
      'Asynchronous programming',
      'Object-oriented programming',
      'Memory management',
      'File compression',
    ],
  ),
  QuizQuestion(
    'Which keyword creates an asynchronous function?',
    [
      'async',
      'await',
      'yield',
      'thread',
    ],
  ),
  QuizQuestion(
    'Which keyword waits for an async task to finish?',
    [
      'await',
      'wait',
      'yield',
      'join',
    ],
  ),
  QuizQuestion(
    'Asyncio is best suited for...',
    [
      'I/O-bound tasks',
      'CPU-bound tasks',
      'Sorting arrays',
      'Creating classes',
    ],
  ),
  QuizQuestion(
    'Which module provides event loops?',
    [
      'asyncio',
      'threading',
      'multiprocessing',
      'time',
    ],
  ),
  QuizQuestion(
    'Which function is commonly used to run an async program?',
    [
      'asyncio.run()',
      'asyncio.start()',
      'run_async()',
      'await.run()',
    ],
  ),

  QuizQuestion(
    'An asynchronous function is also known as a...',
    [
      'Coroutine',
      'Generator',
      'Thread',
      'Process',
    ],
  ),

  QuizQuestion(
    'Where can the await keyword be used?',
    [
      'Inside an async function',
      'Inside any function',
      'Only inside a class',
      'Only inside a loop',
    ],
  ),

  QuizQuestion(
    'What happens if you call an async function without await or asyncio.run()?',
    [
      'It returns a coroutine object',
      'It executes immediately',
      'It raises a SyntaxError',
      'It returns None',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'import asyncio\n\n'
        'async def greet():\n'
        '    return "Hello"\n\n'
        'print(asyncio.run(greet()))',
    [
      'Hello',
      'greet',
      'None',
      'Error',
    ],
  ),

  QuizQuestion(
    'What is the main advantage of asyncio?',
    [
      'It allows many I/O tasks to run efficiently without blocking',
      'It always uses multiple CPU cores',
      'It replaces multiprocessing',
      'It automatically speeds up CPU-bound tasks',
    ],
  ),

  QuizQuestion(
    'Which of the following is commonly used with asyncio?',
    [
      'Network requests',
      'Heavy mathematical calculations',
      'Image rendering only',
      'Creating Python classes',
    ],
  ),
];