import 'package:python_quiz/models/quiz_question.dart';

const encapsulationQuiz = [
  QuizQuestion(
    'Encapsulation means...',
    [
      'Wrapping data and methods together',
      'Creating loops',
      'Handling exceptions',
      'Importing modules',
    ],
  ),
  QuizQuestion(
    'Private variables usually begin with...',
    [
      '__',
      '#',
      '\$',
      '@',
    ],
  ),
  QuizQuestion(
    'Encapsulation improves...',
    [
      'Data security',
      'Compilation speed',
      'Loop execution',
      'Syntax',
    ],
  ),
  QuizQuestion(
    'Getter methods are used to...',
    [
      'Read data',
      'Delete objects',
      'Import modules',
      'Create loops',
    ],
  ),
  QuizQuestion(
    'Setter methods are used to...',
    [
      'Update data',
      'Print output',
      'Handle exceptions',
      'Create classes',
    ],
  ),
  QuizQuestion(
    'What is the main purpose of encapsulation?',
    [
      'Protect an object\'s internal data',
      'Increase CPU speed',
      'Create multiple classes',
      'Replace inheritance',
    ],
  ),

  QuizQuestion(
    'Which decorator is commonly used to create a getter method?',
    [
      '@property',
      '@staticmethod',
      '@classmethod',
      '@override',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'class Student:\n'
        '    def __init__(self):\n'
        '        self.__name = "Arun"\n\n'
        '    def get_name(self):\n'
        '        return self.__name\n\n'
        's = Student()\n'
        'print(s.get_name())',
    [
      'Arun',
      'None',
      'Student',
      'Error',
    ],
  ),

  QuizQuestion(
    'Which method is commonly used to change the value of a private variable?',
    [
      'Setter method',
      'Getter method',
      'Constructor',
      'Destructor',
    ],
  ),

  QuizQuestion(
    'What will happen if you try to access a private variable directly using obj.__name?',
    [
      'It raises an AttributeError',
      'It prints the value',
      'It returns None',
      'It creates a new variable',
    ],
  ),

  QuizQuestion(
    'Which of the following best describes a getter?',
    [
      'A method that returns the value of an attribute',
      'A method that creates a class',
      'A method that deletes an object',
      'A method that imports a module',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'class Person:\n'
        '    def __init__(self):\n'
        '        self.__age = 25\n\n'
        '    @property\n'
        '    def age(self):\n'
        '        return self.__age\n\n'
        'p = Person()\n'
        'print(p.age)',
    [
      '25',
      'age',
      'None',
      'Error',
    ],
  ),

  QuizQuestion(
    'Why are private variables used in encapsulation?',
    [
      'To prevent direct modification of internal data',
      'To increase program speed',
      'To replace methods',
      'To avoid using classes',
    ],
  ),

];