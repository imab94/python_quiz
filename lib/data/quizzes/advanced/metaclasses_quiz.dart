import 'package:python_quiz/models/quiz_question.dart';

const metaclassesQuiz = [
  QuizQuestion(
    'A metaclass is...',
    [
      'A class of classes',
      'A subclass',
      'A function',
      'A decorator',
    ],
  ),
  QuizQuestion(
    'Python default metaclass is...',
    [
      'type',
      'object',
      'class',
      'meta',
    ],
  ),
  QuizQuestion(
    'Metaclasses are mainly used for...',
    [
      'Customizing class creation',
      'File handling',
      'Threading',
      'Loops',
    ],
  ),
  QuizQuestion(
    'Classes are instances of...',
    [
      'Metaclasses',
      'Functions',
      'Objects only',
      'Variables',
    ],
  ),
  QuizQuestion(
    'Metaclasses are considered...',
    [
      'An advanced Python feature',
      'A beginner concept',
      'A database concept',
      'A web framework',
    ],
  ),
  QuizQuestion(
    'Which built-in function can be used to create a class dynamically?',
    [
      'type()',
      'class()',
      'object()',
      'meta()',
    ],
  ),

  QuizQuestion(
    'What does a metaclass control?',
    [
      'How classes are created',
      'How functions are executed',
      'How loops iterate',
      'How files are opened',
    ],
  ),

  QuizQuestion(
    'Which keyword specifies a custom metaclass in a class definition?',
    [
      'metaclass',
      'meta',
      'type',
      'class',
    ],
  ),

  QuizQuestion(
    'When are metaclasses typically needed?',
    [
      'When customizing or enforcing class behavior',
      'For basic variable declarations',
      'For file input and output',
      'For writing simple loops',
    ],
  ),
  QuizQuestion(
    'Which built-in metaclass is used by default for most Python classes?',
    [
      'type',
      'object',
      'ABC',
      'Meta',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'class Person:\n'
        '    pass\n\n'
        'print(type(Person).__name__)',
    [
      'type',
      'Person',
      'object',
      'Error',
    ],
  ),

  QuizQuestion(
    'Which of the following can a metaclass modify?',
    [
      'Class attributes and methods during class creation',
      'Only local variables',
      'Only function parameters',
      'Only loop variables',
    ],
  ),

  QuizQuestion(
    'Why are metaclasses rarely used in everyday Python programming?',
    [
      'Most applications do not require custom class creation',
      'Python does not support them',
      'They work only with abstract classes',
      'They are slower than functions',
    ],
  ),

  QuizQuestion(
    'Which statement about metaclasses is true?',
    [
      'They define how classes are constructed',
      'They replace inheritance',
      'They create threads automatically',
      'They are used only for file handling',
    ],
  ),
];