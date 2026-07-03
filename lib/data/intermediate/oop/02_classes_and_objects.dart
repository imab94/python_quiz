import 'package:python_quiz/data/quizzes/intermediate/oop/classes_objects_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const classesAndObjectsTopic = Topic(
  title: "Classes and Objects",
  level: "Intermediate",
  priority: 13,
  isRecommended: true,
  recommendationReason: "Create reusable objects from well-designed classes.",
  sections: [
    TopicSection(
      title: "What is a Class?",
      content: """
A class is a blueprint or template used to create objects. It defines what data an object will store and what actions it can perform.

Think of a class as a design or plan. It does not contain actual data for every object. Instead, it defines the structure that all objects created from it will follow.

For example, a Student class may define:

Attributes:
• Name
• Age
• Roll Number
• Course

Methods:
• study()
• display_details()
• calculate_percentage()

The class itself does not represent any particular student. It simply describes what every Student object should look like.
""",
    ),

    TopicSection(
      title: "What is an Object?",
      content: """
An object is an instance of a class. It is a real entity created from a class and contains actual values.

If a class is a blueprint, an object is the real product created using that blueprint.

For example:

Class:
Student

Objects:

student1
student2
student3

Although all three objects belong to the same Student class, each object stores different information.

student1

• Name = Arun
• Age = 24

student2

• Name = Rahul
• Age = 21

student3

• Name = Priya
• Age = 22

Each object maintains its own independent data.
""",
    ),

    TopicSection(
      title: "Class vs Object",
      content: """
The following differences help distinguish a class from an object.

Class

• Blueprint or template
• Logical entity
• Defines attributes and methods
• Does not store actual values
• Used to create objects

Object

• Instance of a class
• Physical entity
• Stores actual values
• Occupies memory
• Can access attributes and methods

A single class can create many objects, and each object stores its own unique data.
""",
    ),

    TopicSection(
      title: "Real-World Examples",
      content: """
Understanding classes and objects becomes easier with real-world examples.

Example 1

Class:
Car

Objects:

• Toyota
• BMW
• Honda

----------------------------------------

Example 2

Class:
Employee

Objects:

• John
• David
• Emma

----------------------------------------

Example 3

Class:
MobilePhone

Objects:

• iPhone 16
• Samsung Galaxy S25
• Google Pixel

----------------------------------------

Example 4

Class:
Book

Objects:

• Python Programming
• Data Structures
• Machine Learning

----------------------------------------

Example 5

Class:
BankAccount

Objects:

• Account 1001
• Account 1002
• Account 1003

Every object belongs to the same class but contains different information.
""",
    ),

    TopicSection(
      title: "Creating a Class",
      content: """
In Python, a class is created using the class keyword.

By convention, class names use PascalCase, where each word starts with a capital letter.

Initially, an empty class can be created using the pass keyword.
""",
      syntax: """
class Student:
    pass
""",
      exampleCode: """
class Student:
    pass

print(Student)
""",
      output: """
<class '__main__.Student'>
""",
    ),

    TopicSection(
      title: "Creating Objects",
      content: """
Objects are created by calling the class name followed by parentheses.

Each time the class is called, Python creates a new object in memory.

Multiple objects can be created from the same class.
""",
      syntax: """
object_name = ClassName()
""",
      exampleCode: """
class Student:
    pass

student1 = Student()
student2 = Student()

print(student1)
print(student2)
""",
      output: """
<__main__.Student object at ...>
<__main__.Student object at ...>
""",
    ),

    TopicSection(
      title: "Multiple Objects",
      content: """
One of the biggest advantages of Object-Oriented Programming is that a single class can create any number of objects.

For example, an Employee class can create hundreds or thousands of employee objects.

Each employee object stores its own information such as:

• Employee ID
• Name
• Department
• Salary

Although every object belongs to the same class, changing one object's data does not affect the others.
""",
    ),

    TopicSection(
      title: "Memory Representation",
      content: """
Every object occupies its own memory.

Suppose we create three Student objects.

student1 = Student()

student2 = Student()

student3 = Student()

Python allocates separate memory for each object.

This allows every object to maintain its own state independently.

Even though all three objects belong to the same class, they are completely independent of one another.
""",
    ),

    TopicSection(
      title: "Naming Conventions",
      content: """
Python follows the PEP 8 style guide for naming classes.

Good Class Names:

• Student
• BankAccount
• EmployeeRecord
• MobilePhone

Poor Class Names:

• student
• bank_account
• myclass

Class names should be descriptive and written using PascalCase to improve code readability.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while creating classes and objects.

• Give classes meaningful names.
• Follow PascalCase naming.
• Keep one class responsible for one concept.
• Create multiple objects from a class instead of duplicating code.
• Design classes to represent real-world entities whenever possible.

Well-designed classes make applications easier to understand, extend, and maintain.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example creates a simple Student class and then creates two objects from it.
""",
      exampleCode: """
class Student:
    pass


student1 = Student()
student2 = Student()

print(type(student1))
print(type(student2))

print(student1)
print(student2)
""",
      output: """
<class '__main__.Student'>
<class '__main__.Student'>
<__main__.Student object at ...>
<__main__.Student object at ...>
""",
    ),
  ],
  quizQuestions: classesAndObjectsQuiz,
);