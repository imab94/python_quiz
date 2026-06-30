import 'package:python_quiz/data/quizzes/intermediate/oop/polymorphism_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const polymorphismTopic = Topic(
  title: "Polymorphism",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "What is Polymorphism?",
      content: """
Polymorphism is one of the four fundamental principles of Object-Oriented Programming (OOP).

The word "Polymorphism" comes from two Greek words:

• Poly = Many
• Morph = Forms

Together, polymorphism means "many forms."

In Object-Oriented Programming, polymorphism allows the same method, function, or operator to behave differently depending on the object that is using it.

Instead of writing separate code for every object, programmers can write common code that automatically performs the correct action for each object.

Polymorphism improves flexibility, code reuse, readability, and maintainability, making it one of the most powerful concepts in software development.
""",
    ),

    TopicSection(
      title: "Why Do We Need Polymorphism?",
      content: """
Imagine a drawing application.

It contains different shapes.

• Circle
• Rectangle
• Triangle

Every shape has a draw() method.

Although every object receives the same method call,

shape.draw()

each object performs a different action.

The Circle object draws a circle.

The Rectangle object draws a rectangle.

The Triangle object draws a triangle.

This ability to perform different actions using the same method name is called polymorphism.

Without polymorphism, separate methods would be required for every object, making programs larger and harder to maintain.
""",
    ),

    TopicSection(
      title: "Real-World Examples",
      content: """
Polymorphism appears in many real-world situations.

Example 1

Person

Action:

speak()

Different people speak differently.

----------------------------------------

Example 2

Vehicle

Action:

start()

A car starts differently from a motorcycle.

----------------------------------------

Example 3

Animal

Action:

sound()

Dog

Bark

Cat

Meow

Cow

Moo

Every animal responds differently to the same method call.

----------------------------------------

Example 4

Payment

Action:

pay()

Credit Card

UPI

Net Banking

Cash

All perform payment differently while using the same method name.
""",
    ),

    TopicSection(
      title: "Types of Polymorphism",
      content: """
Polymorphism is generally divided into two types.

1. Compile-Time Polymorphism

Also known as Static Polymorphism.

In many programming languages, it is achieved using method overloading or operator overloading.

Python has limited support for compile-time polymorphism.

----------------------------------------

2. Runtime Polymorphism

Also known as Dynamic Polymorphism.

This is achieved through method overriding.

Python primarily supports runtime polymorphism, making it the most commonly used type of polymorphism in Python applications.
""",
    ),

    TopicSection(
      title: "Compile-Time vs Runtime Polymorphism",
      content: """
Compile-Time Polymorphism

• Decision is made before program execution.
• Faster execution.
• Commonly implemented using method overloading.

----------------------------------------

Runtime Polymorphism

• Decision is made while the program is running.
• Achieved using inheritance and method overriding.
• More flexible.
• Widely used in Python.

Because Python is dynamically typed, runtime polymorphism is much more common than compile-time polymorphism.
""",
    ),

    TopicSection(
      title: "Method Overriding and Polymorphism",
      content: """
Method overriding is the most common implementation of polymorphism in Python.

A child class provides its own implementation of a method already defined in the parent class.

When the method is called using a child object, Python automatically executes the child's version instead of the parent's version.

This allows different objects to respond differently to the same method call.
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
        print("Animal sound")


class Dog(Animal):

    def sound(self):
        print("Bark")


class Cat(Animal):

    def sound(self):
        print("Meow")


dog = Dog()
cat = Cat()

dog.sound()
cat.sound()
""",
      output: """
Bark
Meow
""",
    ),
    TopicSection(
      title: "Duck Typing",
      content: """
Python follows a programming concept known as Duck Typing.

The idea comes from the famous saying:

"If it walks like a duck and quacks like a duck, then it is probably a duck."

In Python, an object's actual type is often less important than the methods or behaviors it provides.

If an object contains the required method, Python allows it to be used, regardless of which class it belongs to.

This makes Python flexible and encourages writing generic, reusable code.

Duck typing is one of the reasons Python supports runtime polymorphism so effectively.
""",
      exampleCode: """
class Dog:

    def speak(self):
        print("Bark")


class Cat:

    def speak(self):
        print("Meow")


def make_sound(animal):
    animal.speak()


dog = Dog()
cat = Cat()

make_sound(dog)
make_sound(cat)
""",
      output: """
Bark
Meow
""",
    ),

    TopicSection(
      title: "Operator Overloading",
      content: """
Operator overloading is another form of polymorphism.

Python allows operators such as +, -, *, ==, <, and others to perform different operations depending on the type of the operands.

For example:

The + operator can:

• Add two numbers.
• Join two strings.
• Combine two lists.

Although the same operator is used, Python performs different operations based on the objects involved.

This behavior is achieved internally using special (dunder) methods such as __add__().
""",
      exampleCode: """
print(10 + 20)

print("Hello " + "Python")

print([1, 2] + [3, 4])
""",
      output: """
30
Hello Python
[1, 2, 3, 4]
""",
    ),

    TopicSection(
      title: "Method Overloading in Python",
      content: """
Many programming languages support method overloading, where multiple methods can have the same name but different parameter lists.

Python does not support traditional method overloading.

If multiple methods with the same name are defined inside a class, only the last definition is retained.

Instead of traditional method overloading, Python programmers commonly use:

• Default arguments
• *args
• **kwargs

These techniques provide flexible behavior similar to method overloading.
""",
      exampleCode: """
class Calculator:

    def add(self, *numbers):
        return sum(numbers)


calculator = Calculator()

print(calculator.add(10, 20))
print(calculator.add(10, 20, 30))
print(calculator.add(10, 20, 30, 40))
""",
      output: """
30
60
100
""",
    ),

    TopicSection(
      title: "Built-in Polymorphism",
      content: """
Python's built-in functions are also polymorphic.

The same function works with many different data types.

Examples include:

• len()
• print()
• max()
• min()
• sum()
• sorted()

These functions automatically behave differently depending on the type of object passed to them.

This is another example of polymorphism in Python.
""",
      exampleCode: """
print(len("Python"))

print(len([10, 20, 30]))

print(len({
    "name": "Arun",
    "age": 24,
}))
""",
      output: """
6
3
2
""",
    ),

    TopicSection(
      title: "Function Polymorphism",
      content: """
Python functions can work with different types of objects as long as those objects support the required operations.

For example, the len() function works with:

• Strings
• Lists
• Tuples
• Sets
• Dictionaries

The same function performs different operations depending on the object that is passed to it.

This flexibility is one of Python's greatest strengths.
""",
      exampleCode: """
print(len("Python"))

print(len((10, 20, 30)))

print(len({1, 2, 3, 4}))
""",
      output: """
6
3
4
""",
    ),

    TopicSection(
      title: "Real-World Applications",
      content: """
Polymorphism is widely used in professional software development.

Some common applications include:

• Payment gateways
• Notification systems
• Database drivers
• Game development
• Graphics applications
• Web frameworks
• Machine learning libraries
• Plugin systems
• API development

Using polymorphism allows developers to write flexible code that can work with many different object types.
""",
    ),
    TopicSection(
      title: "Advantages of Polymorphism",
      content: """
Polymorphism offers many advantages in software development.

• Reduces code duplication.
• Improves code reusability.
• Makes programs flexible.
• Simplifies maintenance.
• Encourages clean and modular design.
• Makes applications easier to extend.
• Reduces dependency between classes.
• Improves scalability.
• Makes code easier to test.

Because of these advantages, polymorphism is heavily used in enterprise software, web frameworks, games, and APIs.
""",
    ),

    TopicSection(
      title: "Disadvantages of Polymorphism",
      content: """
Although polymorphism is extremely useful, it also has some limitations.

• Programs may become harder to understand if overused.
• Debugging can become more difficult because different objects execute different implementations.
• Beginners often find runtime behavior confusing.
• Poor class design may lead to unexpected behavior.

These disadvantages can be minimized by writing clear, well-structured classes and meaningful method names.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while using polymorphism.

• Design parent classes carefully.
• Override methods only when behavior genuinely differs.
• Keep method names meaningful.
• Avoid unnecessary inheritance.
• Use polymorphism to reduce duplicate code.
• Follow the Single Responsibility Principle.
• Prefer readability over clever implementations.

Well-designed polymorphic code is flexible, maintainable, and easy to extend.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates runtime polymorphism by calling the same method on different objects.

Each object responds differently, even though the same method name is used.
""",
      exampleCode: """
class Animal:

    def speak(self):
        print("Animal makes a sound.")


class Dog(Animal):

    def speak(self):
        print("Dog barks.")


class Cat(Animal):

    def speak(self):
        print("Cat meows.")


class Cow(Animal):

    def speak(self):
        print("Cow moos.")


animals = [
    Dog(),
    Cat(),
    Cow(),
]

for animal in animals:
    animal.speak()
""",
      output: """
Dog barks.
Cat meows.
Cow moos.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned one of the four pillars of Object-Oriented Programming—Polymorphism.

You learned:

• What polymorphism is.
• Why polymorphism is important.
• Real-world examples.
• Compile-time and runtime polymorphism.
• Method overriding.
• Duck typing.
• Operator overloading.
• Method overloading in Python.
• Built-in polymorphism.
• Function polymorphism.
• Advantages and disadvantages.
• Best practices.

Polymorphism allows different objects to respond differently to the same method call, making software flexible, reusable, and easier to maintain. It is one of the most widely used concepts in professional Python development.
""",
    ),
  ],
  quizQuestions: polymorphismQuiz,
);