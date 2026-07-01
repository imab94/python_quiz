import 'package:python_quiz/models/quiz_question.dart';

const methodsInOOPQuiz = [
  QuizQuestion(
    'Methods are...',
    [
      'Functions inside a class',
      'Variables',
      'Objects',
      'Packages',
    ],
  ),
  QuizQuestion(
    'Instance methods require...',
    [
      'self',
      'cls',
      'super',
      'None',
    ],
  ),
  QuizQuestion(
    'Which decorator creates a class method?',
    [
      '@classmethod',
      '@staticmethod',
      '@property',
      '@override',
    ],
  ),
  QuizQuestion(
    'Static methods use...',
    [
      '@staticmethod',
      '@classmethod',
      '@property',
      '@self',
    ],
  ),
  QuizQuestion(
    'Methods help to...',
    [
      'Define object behavior',
      'Increase RAM',
      'Import libraries',
      'Compile faster',
    ],
  ),
  QuizQuestion(
    'Which method is automatically called when an object is created?',
    [
      '__init__',
      '__main__',
      '__new__',
      '__call__',
    ],
  ),

  QuizQuestion(
    'Which method can access both instance and class variables?',
    [
      'Instance method',
      'Static method',
      'Lambda function',
      'Generator function',
    ],
  ),

  QuizQuestion(
    'Class methods receive which parameter as their first argument?',
    [
      'cls',
      'self',
      'this',
      'super',
    ],
  ),

  QuizQuestion(
    'Static methods can access instance variables directly?',
    [
      'No',
      'Yes',
      'Only with self',
      'Only with cls',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'class Dog:\n'
        '    def sound(self):\n'
        '        return "Bark"\n\n'
        'd = Dog()\n'
        'print(d.sound())',
    [
      'Bark',
      'Dog',
      'sound',
      'Error',
    ],
  ),

  QuizQuestion(
    'How is an instance method typically called?',
    [
      'Using an object',
      'Using the class only',
      'Using import',
      'Using the type() function',
    ],
  ),

  QuizQuestion(
    'Which type of method is best when no object or class data is required?',
    [
      'Static method',
      'Instance method',
      'Class method',
      'Constructor',
    ],
  ),
];