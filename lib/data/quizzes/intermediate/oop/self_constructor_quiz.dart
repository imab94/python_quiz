import 'package:python_quiz/models/quiz_question.dart';

const selfAndConstructorQuiz = [
  QuizQuestion(
    'What does self refer to?',
    [
      'Current object',
      'Current class',
      'Parent class',
      'Module',
    ],
  ),
  QuizQuestion(
    'Constructor method name?',
    [
      '__init__',
      '__start__',
      '__create__',
      '__newobject__',
    ],
  ),
  QuizQuestion(
    'Constructor executes...',
    [
      'Automatically when object is created',
      'Only manually',
      'During import',
      'After deletion',
    ],
  ),
  QuizQuestion(
    'self must be...',
    [
      'First parameter',
      'Last parameter',
      'Optional',
      'Removed',
    ],
  ),
  QuizQuestion(
    'Constructor is mainly used for...',
    [
      'Initializing object attributes',
      'Deleting objects',
      'Importing modules',
      'Handling exceptions',
    ],
  ),
  QuizQuestion(
    'What happens if __init__() is not defined in a class?',
    [
      'Python provides a default constructor',
      'The class cannot be instantiated',
      'A SyntaxError occurs',
      'The class becomes abstract',
    ],
  ),

  QuizQuestion(
    'Which statement creates an object of the Person class?',
    [
      'p = Person()',
      'Person.create()',
      'new Person()',
      'object Person()',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'class Person:\n'
        '    def __init__(self):\n'
        '        self.name = "Arun"\n\n'
        'p = Person()\n'
        'print(p.name)',
    [
      'Arun',
      'Person',
      'name',
      'Error',
    ],
  ),

  QuizQuestion(
    'Inside a class, how do you access an instance variable named age?',
    [
      'self.age',
      'age.self',
      'this.age',
      'Person.age',
    ],
  ),

  QuizQuestion(
    'What is the purpose of the self parameter?',
    [
      'To access the object’s attributes and methods',
      'To create a new class',
      'To import modules',
      'To define global variables',
    ],
  ),
];