import 'package:python_quiz/models/quiz_question.dart';

const variablesQuiz = [
  QuizQuestion(
    'What is a variable in Python?',
    [
      'A named container used to store data',
      'A Python keyword',
      'A built-in function',
      'A loop statement',
    ],
  ),

  QuizQuestion(
    'Which operator is used to assign a value to a variable?',
    [
      '=',
      '==',
      ':=',
      '->',
    ],
  ),

  QuizQuestion(
    'Which variable name is valid in Python?',
    [
      'student_name',
      '2student',
      'student-name',
      'student name',
    ],
  ),

  QuizQuestion(
    'Python variables are...',
    [
      'Dynamically typed',
      'Statically typed',
      'Always integers',
      'Always strings',
    ],
  ),

  QuizQuestion(
    'Which statement is correct?',
    [
      'Variables can change their values during execution',
      'Variables cannot store strings',
      'Variables cannot store numbers',
      'Variables are constants',
    ],
  ),
  QuizQuestion(
    'Which built-in function returns the data type of a variable?',
    [
      'type()',
      'dtype()',
      'typeof()',
      'class()',
    ],
  ),

  QuizQuestion(
    'What will be the value of x after this code?\n\n'
        'x = 10\n'
        'x = 20',
    [
      '20',
      '10',
      '30',
      'Error',
    ],
  ),
  QuizQuestion(
    'Which of the following is an invalid variable name?',
    [
      '2student',
      'student_2',
      '_student',
      'studentName',
    ],
  ),

  QuizQuestion(
    'Are variable names in Python case-sensitive?',
    [
      'Yes',
      'No',
      'Only for strings',
      'Only for numbers',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'x = y = 100\n'
        'print(x, y)',
    [
      '100 100',
      '100',
      'Error',
      '0 0',
    ],
  ),

  QuizQuestion(
    'What will be the values of x and y after this code?\n\n'
        'x = 10\n'
        'y = 20\n'
        'x, y = y, x',
    [
      'x = 20, y = 10',
      'x = 10, y = 20',
      'x = 20, y = 20',
      'Error',
    ],
  ),

  QuizQuestion(
    'Which naming style is recommended for Python variables?',
    [
      'snake_case',
      'camelCase',
      'PascalCase',
      'UPPERCASE',
    ],
  ),

  QuizQuestion(
    'Why should you use descriptive variable names?',
    [
      'They make code easier to read and maintain',
      'They make programs execute faster',
      'They reduce memory usage',
      'They are required by Python',
    ],
  ),
];