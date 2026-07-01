import 'package:python_quiz/models/quiz_question.dart';

const multithreadingQuiz = [
  QuizQuestion(
    'Which module provides multithreading?',
    [
      'threading',
      'asyncio',
      'thread',
      'parallel',
    ],
  ),
  QuizQuestion(
    'Threads share...',
    [
      'Same memory',
      'Separate memory',
      'Different CPUs only',
      'Nothing',
    ],
  ),
  QuizQuestion(
    'Multithreading is useful for...',
    [
      'I/O-bound tasks',
      'Heavy CPU tasks',
      'Database creation',
      'Sorting only',
    ],
  ),
  QuizQuestion(
    'Which method starts a thread?',
    [
      'start()',
      'run()',
      'execute()',
      'begin()',
    ],
  ),
  QuizQuestion(
    'Which method waits for a thread?',
    [
      'join()',
      'await()',
      'wait()',
      'sleep()',
    ],
  ),
  QuizQuestion(
    'Which class is used to create a new thread?',
    [
      'Thread',
      'Process',
      'Task',
      'Executor',
    ],
  ),

  QuizQuestion(
    'What is the main advantage of multithreading?',
    [
      'It improves responsiveness for I/O operations',
      'It always uses multiple CPU cores',
      'It reduces memory usage to zero',
      'It replaces multiprocessing',
    ],
  ),

  QuizQuestion(
    'Which function pauses the current thread for a specified time?',
    [
      'sleep()',
      'join()',
      'start()',
      'wait()',
    ],
  ),

  QuizQuestion(
    'Which module provides the sleep() function?',
    [
      'time',
      'threading',
      'asyncio',
      'os',
    ],
  ),
  QuizQuestion(
    'Which method contains the code executed by a thread?',
    [
      'run()',
      'start()',
      'join()',
      'sleep()',
    ],
  ),

  QuizQuestion(
    'What does calling start() on a Thread object do?',
    [
      'Starts a new thread and invokes run()',
      'Directly executes join()',
      'Pauses the current thread',
      'Terminates the thread',
    ],
  ),

  QuizQuestion(
    'Which module is generally preferred over threading for CPU-bound tasks?',
    [
      'multiprocessing',
      'time',
      'asyncio',
      'queue',
    ],
  ),

  QuizQuestion(
    'What is the primary benefit of using multiple threads?',
    [
      'They allow tasks to make progress concurrently',
      'They always execute on separate CPU cores',
      'They eliminate the need for processes',
      'They reduce the size of the program',
    ],
  ),
];