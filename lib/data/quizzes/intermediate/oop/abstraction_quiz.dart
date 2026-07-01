import 'package:python_quiz/models/quiz_question.dart';

const abstractionQuiz = [
  QuizQuestion(
    'Abstraction focuses on...',
    [
      'Showing essentials and hiding implementation',
      'Showing everything',
      'Deleting methods',
      'Creating variables',
    ],
  ),
  QuizQuestion(
    'Python abstraction commonly uses...',
    [
      'ABC module',
      'math module',
      'time module',
      'json module',
    ],
  ),
  QuizQuestion(
    'Abstract methods must be...',
    [
      'Implemented by subclasses',
      'Ignored',
      'Deleted',
      'Private',
    ],
  ),
  QuizQuestion(
    'Decorator for abstract methods?',
    [
      '@abstractmethod',
      '@staticmethod',
      '@classmethod',
      '@override',
    ],
  ),
  QuizQuestion(
    'Abstraction improves...',
    [
      'Code design',
      'Internet speed',
      'Memory size',
      'Compilation',
    ],
  ),
  QuizQuestion(
    'What is the main purpose of abstraction?',
    [
      'To hide implementation details and expose only essential features',
      'To increase program speed',
      'To remove inheritance',
      'To create global variables',
    ],
  ),

  QuizQuestion(
    'Which class is commonly imported from the abc module?',
    [
      'ABC',
      'Object',
      'Meta',
      'Abstract',
    ],
  ),

  QuizQuestion(
    'Can an abstract class be instantiated directly?',
    [
      'No',
      'Yes',
      'Only once',
      'Only with super()',
    ],
  ),

  QuizQuestion(
    'What happens if a subclass does not implement all abstract methods?',
    [
      'It cannot be instantiated',
      'It automatically inherits the implementation',
      'Python ignores the abstract method',
      'It becomes a static class',
    ],
  ),

  QuizQuestion(
    'Which statement imports both ABC and abstractmethod?',
    [
      'from abc import ABC, abstractmethod',
      'import ABC',
      'from python import ABC',
      'import abstractmethod',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'from abc import ABC, abstractmethod\n\n'
        'class Shape(ABC):\n'
        '    @abstractmethod\n'
        '    def area(self):\n'
        '        pass\n\n'
        'class Square(Shape):\n'
        '    def area(self):\n'
        '        return 25\n\n'
        'print(Square().area())',
    [
      '25',
      'Shape',
      'None',
      'Error',
    ],
  ),

  QuizQuestion(
    'An abstract class can contain...',
    [
      'Both abstract and regular methods',
      'Only abstract methods',
      'Only constructors',
      'No methods',
    ],
  ),

  QuizQuestion(
    'Which OOP principle hides unnecessary implementation details from users?',
    [
      'Abstraction',
      'Encapsulation',
      'Inheritance',
      'Polymorphism',
    ],
  ),
];