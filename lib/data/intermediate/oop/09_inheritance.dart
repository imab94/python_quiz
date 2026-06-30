import 'package:python_quiz/data/quizzes/intermediate/oop/inheritance_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const inheritanceTopic = Topic(
  title: "Inheritance",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "What is Inheritance?",
      content: """
Inheritance is one of the four fundamental principles of Object-Oriented Programming (OOP).

Inheritance allows one class to acquire the properties and behaviors of another class. Instead of writing the same code again and again, a new class can reuse the existing code from another class.

The existing class is called the Parent Class (or Base Class), while the new class is called the Child Class (or Derived Class).

The child class automatically inherits the variables and methods of the parent class. It can also add new variables and methods or modify inherited behavior.

Inheritance promotes code reuse, reduces duplication, and makes programs easier to maintain. It is one of the most widely used features in modern software development.
""",
    ),

    TopicSection(
      title: "Why Do We Need Inheritance?",
      content: """
Imagine you are creating a School Management System.

You create a class called Person that stores common information.

• Name
• Age
• Address

Now you need classes for:

• Student
• Teacher
• Principal

Without inheritance, every class would contain the same variables and methods, resulting in duplicate code.

With inheritance, Student, Teacher, and Principal can inherit these common properties from the Person class.

Each child class can then add its own unique features.

Student

• Roll Number
• Course

Teacher

• Subject
• Salary

Principal

• Office Number
• Department

Inheritance helps developers avoid code duplication and makes applications much easier to maintain.
""",
    ),

    TopicSection(
      title: "Parent Class and Child Class",
      content: """
Inheritance involves two main classes.

Parent Class (Base Class)

The class whose members are inherited by another class.

Child Class (Derived Class)

The class that inherits from the parent class.

The child class automatically gains access to the parent's public methods and variables.

It can also:

• Add new variables.
• Add new methods.
• Override inherited methods.
• Extend existing functionality.

This relationship allows programmers to build new classes without rewriting existing code.
""",
    ),

    TopicSection(
      title: "Creating a Parent Class",
      content: """
A parent class is created like any normal Python class.

It contains the common variables and methods that should be shared with other classes.

Multiple child classes can inherit from the same parent class.
""",
      syntax: """
class Person:

    def display(self):
        print("I am a person.")
""",
      exampleCode: """
class Person:

    def display(self):
        print("I am a person.")


person = Person()

person.display()
""",
      output: """
I am a person.
""",
    ),

    TopicSection(
      title: "Creating a Child Class",
      content: """
A child class is created by placing the parent class name inside parentheses after the child class name.

The child class automatically inherits all accessible variables and methods from the parent class.

No additional code is required to inherit these members.
""",
      syntax: """
class ChildClass(ParentClass):
    pass
""",
      exampleCode: """
class Person:

    def display(self):
        print("I am a person.")


class Student(Person):
    pass


student = Student()

student.display()
""",
      output: """
I am a person.
""",
    ),

    TopicSection(
      title: "Accessing Parent Class Members",
      content: """
Once inheritance is established, objects of the child class can directly access the public members of the parent class.

This includes:

• Variables
• Methods

The child class behaves as if these members were defined inside it.

This is the main advantage of inheritance because it eliminates unnecessary code duplication.
""",
      exampleCode: """
class Person:

    def introduce(self):
        print("Welcome!")


class Student(Person):
    pass


student = Student()

student.introduce()
""",
      output: """
Welcome!
""",
    ),

    TopicSection(
      title: "Real-World Examples",
      content: """
Inheritance is used extensively in real-world software.

Example 1

Parent Class

Vehicle

Child Classes

• Car
• Bike
• Bus
• Truck

----------------------------------------

Example 2

Parent Class

Animal

Child Classes

• Dog
• Cat
• Lion
• Elephant

----------------------------------------

Example 3

Parent Class

Employee

Child Classes

• Manager
• Developer
• Tester
• HR

----------------------------------------

Example 4

Parent Class

Account

Child Classes

• SavingsAccount
• CurrentAccount
• SalaryAccount

In every example, child classes reuse the common functionality of the parent class while adding their own unique features.
""",
    ),

    TopicSection(
      title: "Advantages of Inheritance",
      content: """
Inheritance provides several important benefits.

• Reduces code duplication.
• Promotes code reuse.
• Improves readability.
• Makes programs easier to maintain.
• Allows easy extension of existing classes.
• Supports hierarchical relationships.
• Encourages modular software design.
• Reduces development time.

Inheritance is one of the main reasons Object-Oriented Programming is widely used in large software applications.
""",
    ),
    TopicSection(
      title: "The super() Function",
      content: """
The super() function is used to access the methods and constructors of the parent class.

Sometimes a child class needs to use the functionality already defined in its parent class instead of rewriting the same code.

The super() function allows the child class to call:

• Parent constructors
• Parent methods

Using super() improves code reuse and keeps programs easier to maintain.

It is commonly used inside constructors to initialize inherited attributes.
""",
      syntax: """
super().__init__()

super().method_name()
""",
      exampleCode: """
class Person:

    def __init__(self, name):
        self.name = name


class Student(Person):

    def __init__(self, name, course):
        super().__init__(name)
        self.course = course


student = Student("Arun", "Python")

print(student.name)
print(student.course)
""",
      output: """
Arun
Python
""",
    ),

    TopicSection(
      title: "Why Use super()?",
      content: """
Without super(), the child class would need to repeat the parent's initialization code.

This creates duplicate code and makes maintenance difficult.

Using super():

• Reduces duplicate code.
• Automatically initializes parent members.
• Makes inheritance cleaner.
• Simplifies constructor chaining.
• Improves readability.

Most professional Python projects use super() whenever a child class extends a parent class.
""",
    ),

    TopicSection(
      title: "Method Overriding",
      content: """
Method overriding occurs when a child class provides its own implementation of a method that already exists in the parent class.

The child method replaces the parent's version whenever that method is called using a child object.

Method overriding allows child classes to customize inherited behavior without modifying the parent class.

This is one of the most important features of Object-Oriented Programming.
""",
      syntax: """
class Parent:

    def method(self):
        pass


class Child(Parent):

    def method(self):
        pass
""",
      exampleCode: """
class Animal:

    def sound(self):
        print("Animal makes a sound.")


class Dog(Animal):

    def sound(self):
        print("Dog barks.")


dog = Dog()

dog.sound()
""",
      output: """
Dog barks.
""",
    ),

    TopicSection(
      title: "Calling the Parent Method",
      content: """
Sometimes a child class does not want to completely replace the parent's implementation.

Instead, it wants to execute the parent's method first and then add additional functionality.

This can be achieved using super().
""",
      exampleCode: """
class Animal:

    def sound(self):
        print("Animal makes a sound.")


class Dog(Animal):

    def sound(self):
        super().sound()
        print("Dog barks.")


dog = Dog()

dog.sound()
""",
      output: """
Animal makes a sound.
Dog barks.
""",
    ),

    TopicSection(
      title: "Single Inheritance",
      content: """
Single inheritance means one child class inherits from one parent class.

This is the simplest and most commonly used type of inheritance.

Example:

Person

↓

Student

The Student class inherits all accessible members from the Person class.
""",
      syntax: """
class Parent:
    pass


class Child(Parent):
    pass
""",
    ),

    TopicSection(
      title: "Multiple Inheritance",
      content: """
Multiple inheritance means one child class inherits from more than one parent class.

Example:

Teacher

        ↘

          Trainer

        ↗

Employee

The child class can access members from both parent classes.

Python fully supports multiple inheritance.
""",
      syntax: """
class Parent1:
    pass


class Parent2:
    pass


class Child(Parent1, Parent2):
    pass
""",
    ),

    TopicSection(
      title: "Multilevel Inheritance",
      content: """
Multilevel inheritance occurs when inheritance forms a chain.

Example:

Person

↓

Employee

↓

Manager

The Manager class inherits from Employee, and Employee inherits from Person.

Therefore, Manager receives members from both parent classes.
""",
      syntax: """
class A:
    pass


class B(A):
    pass


class C(B):
    pass
""",
    ),

    TopicSection(
      title: "Hierarchical Inheritance",
      content: """
Hierarchical inheritance occurs when multiple child classes inherit from the same parent class.

Example:

        Person

      ↙     ↘

Student   Teacher

Both Student and Teacher inherit the common functionality from the Person class.
""",
      syntax: """
class Parent:
    pass


class Child1(Parent):
    pass


class Child2(Parent):
    pass
""",
    ),

    TopicSection(
      title: "Hybrid Inheritance",
      content: """
Hybrid inheritance is a combination of two or more inheritance types.

It may combine:

• Single inheritance
• Multiple inheritance
• Multilevel inheritance
• Hierarchical inheritance

Large software applications often use hybrid inheritance to model complex relationships between classes.

Python supports hybrid inheritance because it supports multiple inheritance.
""",
    ),
    TopicSection(
      title: "Method Resolution Order (MRO)",
      content: """
When a class inherits from multiple parent classes, Python must decide which parent's method should be executed if multiple parents contain a method with the same name.

The order in which Python searches for methods is called the Method Resolution Order (MRO).

Python follows the C3 Linearization algorithm to determine this order.

You can view the MRO of a class using:

ClassName.mro()

or

ClassName.__mro__

Understanding MRO is especially important when working with multiple inheritance because it determines which method Python executes first.
""",
      syntax: """
ClassName.mro()

ClassName.__mro__
""",
      exampleCode: """
class A:
    pass


class B(A):
    pass


class C(B):
    pass


print(C.mro())
""",
      output: """
[<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
""",
    ),

    TopicSection(
      title: "The Diamond Problem",
      content: """
The Diamond Problem occurs when a class inherits from two parent classes that both inherit from the same grandparent class.

Example:

        A
       / \\
      B   C
       \\ /
        D

If class A contains a method and neither B nor C overrides it, Python must determine which path should be followed.

Unlike some programming languages, Python solves this problem automatically using Method Resolution Order (MRO).

Because of MRO, Python knows exactly which method should be executed without ambiguity.
""",
    ),

    TopicSection(
      title: "The isinstance() Function",
      content: """
The isinstance() function checks whether an object belongs to a particular class.

It returns:

True

if the object is an instance of the specified class.

Otherwise it returns:

False

This function also considers inheritance. If an object belongs to a child class, isinstance() also returns True for its parent classes.
""",
      syntax: """
isinstance(object, ClassName)
""",
      exampleCode: """
class Person:
    pass


class Student(Person):
    pass


student = Student()

print(isinstance(student, Student))
print(isinstance(student, Person))
""",
      output: """
True
True
""",
    ),

    TopicSection(
      title: "The issubclass() Function",
      content: """
The issubclass() function checks whether one class inherits from another class.

Unlike isinstance(), it works with classes instead of objects.

It returns:

True

if the first class inherits from the second class.

Otherwise it returns:

False.
""",
      syntax: """
issubclass(ChildClass, ParentClass)
""",
      exampleCode: """
class Person:
    pass


class Student(Person):
    pass


print(issubclass(Student, Person))
print(issubclass(Person, Student))
""",
      output: """
True
False
""",
    ),

    TopicSection(
      title: "Advantages of Inheritance",
      content: """
Inheritance offers many advantages in software development.

• Promotes code reuse.
• Reduces duplicate code.
• Improves code organization.
• Makes programs easier to maintain.
• Simplifies software development.
• Encourages modular programming.
• Supports hierarchical relationships.
• Makes applications easier to extend.
• Improves readability.
• Saves development time.

These advantages make inheritance one of the most powerful concepts in Object-Oriented Programming.
""",
    ),

    TopicSection(
      title: "Disadvantages of Inheritance",
      content: """
Although inheritance is powerful, it should be used carefully.

Some disadvantages include:

• Deep inheritance hierarchies can become difficult to understand.
• Changes in a parent class may affect child classes.
• Excessive inheritance increases code complexity.
• Multiple inheritance can make code harder to follow.
• Sometimes composition is a better design choice than inheritance.

Good software design uses inheritance only when there is a true "is-a" relationship between classes.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while using inheritance.

• Use inheritance only when a true "is-a" relationship exists.
• Keep inheritance hierarchies simple.
• Avoid unnecessary levels of inheritance.
• Use super() instead of directly calling parent methods.
• Override methods only when necessary.
• Prefer composition over inheritance when objects simply collaborate rather than inherit behavior.
• Follow meaningful class naming conventions.

Well-designed inheritance improves code quality without making the program unnecessarily complex.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates inheritance, constructors, super(), method overriding, and inherited methods working together.
""",
      exampleCode: """
class Person:

    def __init__(self, name):
        self.name = name

    def introduce(self):
        print("My name is", self.name)


class Student(Person):

    def __init__(self, name, course):
        super().__init__(name)
        self.course = course

    def introduce(self):
        super().introduce()
        print("Course:", self.course)


student = Student("Arun", "Python")

student.introduce()

print(isinstance(student, Student))
print(isinstance(student, Person))
print(issubclass(Student, Person))
""",
      output: """
My name is Arun
Course: Python
True
True
True
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned one of the most important concepts of Object-Oriented Programming—Inheritance.

You learned:

• What inheritance is.
• Why inheritance is used.
• Parent and child classes.
• The super() function.
• Method overriding.
• Single inheritance.
• Multiple inheritance.
• Multilevel inheritance.
• Hierarchical inheritance.
• Hybrid inheritance.
• Method Resolution Order (MRO).
• The Diamond Problem.
• isinstance() and issubclass().
• Advantages and disadvantages of inheritance.
• Best practices.

Inheritance is one of the four pillars of Object-Oriented Programming and is widely used in professional Python applications to build reusable and maintainable software.
""",
    ),
  ],
  quizQuestions: inheritanceQuiz,
);