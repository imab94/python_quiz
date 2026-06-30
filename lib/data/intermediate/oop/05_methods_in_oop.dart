import 'package:python_quiz/data/quizzes/intermediate/oop/methods_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const methodsInOOPTopic = Topic(
  title: "Methods in OOP",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "What is a Method?",
      content: """
A method is a function that belongs to a class. Just like functions perform specific tasks in a Python program, methods perform tasks related to objects of a class.

Methods define the behavior of an object. While variables store information about an object, methods describe what the object can do.

For example, a Student object may have methods such as:

• study()
• display_details()
• attend_class()

Similarly, a BankAccount object may have methods like:

• deposit()
• withdraw()
• check_balance()

Methods help organize code by keeping both the data and the operations on that data inside the same class.
""",
    ),

    TopicSection(
      title: "Why Do We Need Methods?",
      content: """
Without methods, every operation would have to be written as a separate function outside the class.

Methods provide several advantages.

• Keep related code together.
• Improve code readability.
• Increase code reusability.
• Allow objects to perform actions.
• Support encapsulation.
• Make programs easier to maintain.

Methods are one of the key features that make Object-Oriented Programming powerful.
""",
    ),

    TopicSection(
      title: "Instance Methods",
      content: """
Instance methods are the most common type of methods in Python.

They work with instance variables and belong to individual objects.

Every instance method must have self as its first parameter.

Using self allows the method to access and modify the current object's data.

Different objects can call the same instance method while working with their own data independently.
""",
      syntax: """
class Student:

    def display(self):
        statements
""",
      exampleCode: """
class Student:

    def __init__(self, name):
        self.name = name

    def display(self):
        print("Student:", self.name)


student = Student("Arun")

student.display()
""",
      output: """
Student: Arun
""",
    ),

    TopicSection(
      title: "Class Methods",
      content: """
Class methods belong to the class rather than individual objects.

They are created using the @classmethod decorator.

Instead of self, they receive cls as their first parameter.

The cls parameter refers to the class itself.

Class methods are mainly used to access or modify class variables that are shared by every object.
""",
      syntax: """
class Student:

    @classmethod
    def method_name(cls):
        statements
""",
      exampleCode: """
class Student:

    school_name = "ABC School"

    @classmethod
    def display_school(cls):
        print(cls.school_name)


Student.display_school()
""",
      output: """
ABC School
""",
    ),

    TopicSection(
      title: "Static Methods",
      content: """
Static methods belong to the class but do not access instance variables or class variables.

They are created using the @staticmethod decorator.

Static methods do not receive self or cls as parameters.

They are mainly used for helper or utility functions that logically belong to the class but do not require any object or class data.
""",
      syntax: """
class Student:

    @staticmethod
    def method_name():
        statements
""",
      exampleCode: """
class Student:

    @staticmethod
    def greet():
        print("Welcome to Python!")


Student.greet()
""",
      output: """
Welcome to Python!
""",
    ),

    TopicSection(
      title: "Difference Between Instance, Class and Static Methods",
      content: """
Instance Method

• Belongs to an object.
• Uses self.
• Can access instance variables.
• Can access class variables.

----------------------------------------

Class Method

• Belongs to the class.
• Uses cls.
• Can access class variables.
• Cannot directly access instance variables.

----------------------------------------

Static Method

• Belongs to the class.
• Uses neither self nor cls.
• Cannot directly access instance variables.
• Cannot directly access class variables.
• Used for utility or helper operations.
""",
    ),

    TopicSection(
      title: "Calling Different Types of Methods",
      content: """
Instance methods are usually called using objects.

Example:

student.display()

Class methods can be called using either the class or an object, although calling them through the class is recommended.

Example:

Student.display_school()

Static methods are generally called using the class name.

Example:

Student.greet()
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when writing methods.

• Use instance methods when working with object-specific data.
• Use class methods when working with shared class data.
• Use static methods for utility functions.
• Keep each method focused on one responsibility.
• Give methods meaningful names.
• Follow snake_case naming conventions.
• Avoid writing very long methods.

Choosing the correct type of method makes classes easier to understand and maintain.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates all three types of methods in one class.
""",
      exampleCode: """
class Student:

    school_name = "ABC School"

    def __init__(self, name):
        self.name = name

    def display(self):
        print("Student:", self.name)

    @classmethod
    def display_school(cls):
        print("School:", cls.school_name)

    @staticmethod
    def greet():
        print("Welcome to the Student Portal!")


student = Student("Arun")

student.display()
Student.display_school()
Student.greet()
""",
      output: """
Student: Arun
School: ABC School
Welcome to the Student Portal!
""",
    ),
  ],
  quizQuestions: methodsInOOPQuiz,
);