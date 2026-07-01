import 'package:python_quiz/models/quiz_question.dart';

const inheritanceQuiz = [
  QuizQuestion(
    'Inheritance allows...',
    [
      'Code reuse',
      'Deleting classes',
      'Removing methods',
      'Creating loops',
    ],
  ),
  QuizQuestion(
    'Parent class is also called...',
    [
      'Base class',
      'Child class',
      'Object class',
      'Instance class',
    ],
  ),
  QuizQuestion(
    'Child class is also called...',
    [
      'Derived class',
      'Base class',
      'Parent class',
      'Abstract class',
    ],
  ),
  QuizQuestion(
    'Which keyword accesses parent methods?',
    [
      'super()',
      'parent()',
      'base()',
      'inherit()',
    ],
  ),
  QuizQuestion(
    'Inheritance represents...',
    [
      'IS-A relationship',
      'HAS-A relationship',
      'FOR relationship',
      'WITH relationship',
    ],
  ),
  QuizQuestion(
    'Which class inherits the properties of another class?',
    [
      'Child (derived) class',
      'Parent (base) class',
      'Abstract class',
      'Static class',
    ],
  ),

  QuizQuestion(
    'What is the main benefit of inheritance?',
    [
      'It reduces code duplication',
      'It increases memory usage',
      'It removes the need for methods',
      'It replaces variables',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'class Animal:\n'
        '    def sound(self):\n'
        '        return "Animal"\n\n'
        'class Dog(Animal):\n'
        '    pass\n\n'
        'print(Dog().sound())',
    [
      'Animal',
      'Dog',
      'None',
      'Error',
    ],
  ),

  QuizQuestion(
    'What is the purpose of super() in Python?',
    [
      'To call methods of the parent class',
      'To create a new object',
      'To delete the parent class',
      'To override a method',
    ],
  ),

  QuizQuestion(
    'Can a child class override a method inherited from its parent?',
    [
      'Yes',
      'No',
      'Only in abstract classes',
      'Only in static methods',
    ],
  ),

  QuizQuestion(
    'What type of inheritance occurs when one child class inherits from one parent class?',
    [
      'Single inheritance',
      'Multiple inheritance',
      'Hierarchical inheritance',
      'Multilevel inheritance',
    ],
  ),
];