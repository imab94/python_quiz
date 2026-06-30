import 'package:python_quiz/data/quizzes/intermediate/oop/self_constructor_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const selfAndConstructorTopic = Topic(
  title: "The self Keyword and Constructors",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "Understanding the self Keyword",
      content: """
The self keyword is one of the most important concepts in Python Object-Oriented Programming.

The self parameter represents the current object that is calling a method. It allows an object to access its own attributes and methods.

Whenever an object calls one of its methods, Python automatically passes that object as the first argument to the method. By convention, this first parameter is named self.

Although you can technically choose another name, every Python programmer uses self because it is the official convention and makes code easier to understand.

Without self, Python would not know which object's data should be accessed.
""",
    ),

    TopicSection(
      title: "How self Works",
      content: """
Consider two Student objects.

student1

Name = Arun

student2

Name = Rahul

When we execute:

student1.display()

Python internally converts it to:

Student.display(student1)

Similarly,

student2.display()

becomes:

Student.display(student2)

This means the self parameter refers to student1 during the first call and student2 during the second call.

Because of this mechanism, each object accesses its own data independently.
""",
    ),

    TopicSection(
      title: "Using self to Access Attributes",
      content: """
The self keyword is used to access the attributes and methods of the current object.

Common examples include:

self.name

self.age

self.course

Similarly, methods can also be called using self.

Example:

self.display_details()

Using self ensures that every object works with its own data.
""",
      syntax: """
self.attribute_name

self.method_name()
""",
      exampleCode: """
class Student:

    def display(self):
        print("Hello Student")


student = Student()

student.display()
""",
      output: """
Hello Student
""",
    ),

    TopicSection(
      title: "What is a Constructor?",
      content: """
A constructor is a special method that automatically executes whenever an object is created.

Its primary purpose is to initialize the object's data.

In Python, the constructor is named __init__().

Unlike normal methods, you never call the constructor directly. Python automatically calls it whenever a new object is created.

Constructors help ensure that every object starts with valid and properly initialized data.
""",
    ),

    TopicSection(
      title: "The __init__() Method",
      content: """
The __init__() method is also known as the initializer.

It is executed immediately after an object is created.

Most classes use this method to assign initial values to instance variables.
""",
      syntax: """
class ClassName:

    def __init__(self):
        statements
""",
      exampleCode: """
class Student:

    def __init__(self):
        print("Student object created.")


student = Student()
""",
      output: """
Student object created.
""",
    ),

    TopicSection(
      title: "Parameterized Constructors",
      content: """
Real-world objects usually require information during creation.

A parameterized constructor accepts additional parameters and stores them inside the object.

Each object receives its own values, allowing multiple objects to contain different information while sharing the same class.
""",
      syntax: """
class Student:

    def __init__(self, name, age):
        self.name = name
        self.age = age
""",
      exampleCode: """
class Student:

    def __init__(self, name, age):
        self.name = name
        self.age = age


student1 = Student("Arun", 24)
student2 = Student("Rahul", 21)

print(student1.name)
print(student2.name)
""",
      output: """
Arun
Rahul
""",
    ),

    TopicSection(
      title: "Initializing Instance Variables",
      content: """
Inside the constructor, values are usually assigned like this:

self.name = name

self.age = age

self.course = course

The value on the right side is the constructor parameter.

The variable on the left side becomes an attribute of the object.

Every object stores its own copy of these attributes.
""",
    ),

    TopicSection(
      title: "Object Creation Process",
      content: """
Whenever an object is created, Python performs the following steps automatically.

1. Allocates memory for the object.

2. Calls the __init__() constructor.

3. Initializes the object's attributes.

4. Returns the fully initialized object.

All of these steps happen automatically with a single statement.

Example:

student = Student("Arun", 24)
""",
    ),

    TopicSection(
      title: "Why Use Constructors?",
      content: """
Constructors provide several advantages.

• Automatically initialize objects.
• Reduce repetitive code.
• Ensure every object starts with valid data.
• Improve readability.
• Make programs easier to maintain.
• Prevent forgetting to initialize important attributes.

Almost every real-world Python class uses constructors.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while using self and constructors.

• Always use self as the first parameter of instance methods.
• Initialize all instance variables inside the constructor.
• Keep constructors simple and focused on initialization.
• Give constructor parameters meaningful names.
• Avoid performing complex business logic inside __init__().

A well-designed constructor makes classes easier to use and understand.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates the use of the self keyword and a parameterized constructor.
""",
      exampleCode: """
class Student:

    def __init__(self, name, age, course):
        self.name = name
        self.age = age
        self.course = course

    def display(self):
        print("Name   :", self.name)
        print("Age    :", self.age)
        print("Course :", self.course)


student = Student("Arun", 24, "Python")

student.display()
""",
      output: """
Name   : Arun
Age    : 24
Course : Python
""",
    ),
  ],
  quizQuestions: selfAndConstructorQuiz,
);