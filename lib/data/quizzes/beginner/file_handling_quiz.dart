import 'package:python_quiz/models/quiz_question.dart';

const fileHandlingQuiz = [
  QuizQuestion(
    'Which function opens a file in Python?',
    [
      'open()',
      'read()',
      'file()',
      'create()',
    ],
  ),

  QuizQuestion(
    'Which mode opens a file for reading?',
    [
      'r',
      'w',
      'a',
      'x',
    ],
  ),

  QuizQuestion(
    'Which mode appends data to an existing file?',
    [
      'a',
      'w',
      'r',
      'x',
    ],
  ),

  QuizQuestion(
    'Why should files be closed after use?',
    [
      'To release system resources',
      'To delete the file',
      'To encrypt the file',
      'To rename the file',
    ],
  ),

  QuizQuestion(
    'Which statement automatically closes a file?',
    [
      'with',
      'try',
      'for',
      'while',
    ],
  ),
  QuizQuestion(
    'Which method reads the entire contents of a file?',
    [
      'read()',
      'write()',
      'append()',
      'close()',
    ],
  ),

  QuizQuestion(
    'Which method writes data to a file?',
    [
      'write()',
      'read()',
      'append()',
      'open()',
    ],
  ),

  QuizQuestion(
    'Which mode creates a new file and fails if it already exists?',
    [
      'x',
      'w',
      'a',
      'r',
    ],
  ),

  QuizQuestion(
    'Which method reads a file one line at a time into a list?',
    [
      'readlines()',
      'read()',
      'write()',
      'split()',
    ],
  ),

  QuizQuestion(
    'What happens if you open a file in "w" mode that already exists?',
    [
      'Its contents are overwritten',
      'An error is raised',
      'Data is appended',
      'Nothing happens',
    ],
  ),

  QuizQuestion(
    'Which method closes an open file manually?',
    [
      'close()',
      'stop()',
      'exit()',
      'end()',
    ],
  ),
];