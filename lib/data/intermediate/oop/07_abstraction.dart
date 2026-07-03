import 'package:python_quiz/data/quizzes/intermediate/oop/abstraction_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const abstractionTopic = Topic(
  title: "Abstraction",
  level: "Intermediate",
  priority: 18,
  isRecommended: true,
  recommendationReason: "Hide complexity behind simple, clean interfaces.",
  sections: [
    TopicSection(
      title: "What is Abstraction?",
      content: """
Abstraction is one of the four fundamental principles of Object-Oriented Programming (OOP).

Abstraction is the process of hiding implementation details and showing only the essential features of an object.

Instead of exposing how something works internally, abstraction allows users to focus only on what an object can do.

This reduces complexity and makes programs easier to understand and use.

In simple words, abstraction means "show only what is necessary and hide the rest."

Python supports abstraction using Abstract Base Classes (ABC) and abstract methods.
""",
    ),

    TopicSection(
      title: "Why Do We Need Abstraction?",
      content: """
Imagine driving a car.

To drive the car, you only need to know how to use:

• Steering wheel
• Accelerator
• Brake
• Gear

You do not need to understand how the engine, transmission, or fuel injection system works internally.

The complex implementation is hidden.

Similarly, in software development, users only interact with the features they need while the internal implementation remains hidden.

This is exactly what abstraction provides.
""",
    ),

    TopicSection(
      title: "Real-World Examples",
      content: """
Abstraction is used everywhere in daily life.

Example 1

ATM Machine

Visible:

• Withdraw Money
• Deposit Money
• Check Balance

Hidden:

• Database operations
• Authentication
• Transaction processing

----------------------------------------

Example 2

Television Remote

Visible:

• Power
• Volume
• Channel

Hidden:

• Electronic circuits
• Signal transmission
• Hardware processing

----------------------------------------

Example 3

Mobile Phone

Visible:

• Make Calls
• Send Messages
• Open Apps

Hidden:

• Network communication
• Operating system
• Memory management

These are all examples of abstraction because users interact only with the necessary features.
""",
    ),

    TopicSection(
      title: "Benefits of Abstraction",
      content: """
Abstraction provides many advantages.

• Reduces complexity.
• Hides implementation details.
• Improves security.
• Makes code easier to understand.
• Simplifies maintenance.
• Encourages modular programming.
• Improves scalability.
• Makes applications easier to extend.

Abstraction allows developers to modify internal implementations without affecting the code that uses the class.
""",
    ),

    TopicSection(
      title: "Abstraction in Python",
      content: """
Python does not support abstraction directly like some other programming languages.

Instead, Python provides the abc (Abstract Base Class) module.

Using this module, developers can create abstract classes and abstract methods.

An abstract class acts as a blueprint for other classes.

A child class must implement all abstract methods before objects of that child class can be created.
""",
    ),

    TopicSection(
      title: "Abstract Base Class (ABC)",
      content: """
An Abstract Base Class (ABC) is a class that cannot be instantiated directly.

Its main purpose is to define a common interface that child classes must follow.

Abstract classes are created by inheriting from the ABC class provided by Python's abc module.

Abstract classes often contain one or more abstract methods that child classes are required to implement.
""",
      syntax: """
from abc import ABC

class ClassName(ABC):
    pass
""",
      exampleCode: """
from abc import ABC


class Animal(ABC):
    pass


print(Animal)
""",
      output: """
<class '__main__.Animal'>
""",
    ),
    TopicSection(
      title: "Abstract Methods",
      content: """
An abstract method is a method that is declared but does not contain an implementation.

Instead of defining how the method works, an abstract method only defines what method every child class must provide.

Every class that inherits from an abstract class must implement all of its abstract methods.

If a child class does not implement an abstract method, Python will not allow objects of that class to be created.

Abstract methods establish a common contract that every child class must follow.
""",
    ),

    TopicSection(
      title: "The @abstractmethod Decorator",
      content: """
Python provides the @abstractmethod decorator to declare abstract methods.

This decorator is available in the abc module.

When a method is marked with @abstractmethod, every child class must provide its own implementation of that method.

Without implementing all abstract methods, the child class remains abstract and cannot be instantiated.
""",
      syntax: """
from abc import ABC, abstractmethod

class Animal(ABC):

    @abstractmethod
    def sound(self):
        pass
""",
    ),

    TopicSection(
      title: "Creating an Abstract Class",
      content: """
To create an abstract class, inherit from the ABC class and decorate one or more methods using @abstractmethod.

The abstract class defines the methods that every child class must implement.

Although the abstract class cannot create objects, it serves as a blueprint for other classes.
""",
      exampleCode: """
from abc import ABC, abstractmethod


class Animal(ABC):

    @abstractmethod
    def sound(self):
        pass
""",
    ),

    TopicSection(
      title: "Implementing Abstract Methods",
      content: """
A child class must provide an implementation for every abstract method inherited from the abstract class.

Once all abstract methods are implemented, objects of the child class can be created normally.

Each child class may provide its own implementation while following the same interface defined by the abstract class.
""",
      exampleCode: """
from abc import ABC, abstractmethod


class Animal(ABC):

    @abstractmethod
    def sound(self):
        pass


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
      title: "What Happens if an Abstract Method is Not Implemented?",
      content: """
If a child class inherits from an abstract class but does not implement every abstract method, Python considers that child class abstract as well.

Objects of that child class cannot be created until all abstract methods are implemented.

This prevents incomplete classes from being used accidentally and ensures that every required behavior is provided.
""",
      exampleCode: """
from abc import ABC, abstractmethod


class Animal(ABC):

    @abstractmethod
    def sound(self):
        pass


class Dog(Animal):
    pass


dog = Dog()
""",
      output: """
TypeError:
Can't instantiate abstract class Dog with abstract method sound
""",
    ),

    TopicSection(
      title: "Multiple Abstract Methods",
      content: """
An abstract class can contain one or many abstract methods.

Every child class must implement every abstract method inherited from the parent class.

This allows the abstract class to define a complete blueprint that every child class must follow.

Large applications often define several abstract methods inside a single abstract class.
""",
      exampleCode: """
from abc import ABC, abstractmethod


class Shape(ABC):

    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass
""",
    ),

    TopicSection(
      title: "Rules for Abstract Classes",
      content: """
When working with abstract classes, remember the following rules.

• An abstract class cannot be instantiated.
• An abstract class may contain zero or more abstract methods.
• Child classes must implement every abstract method.
• Abstract classes can also contain normal methods.
• Abstract classes are created by inheriting from ABC.
• Abstract methods are declared using @abstractmethod.

Following these rules helps create consistent and reliable class hierarchies.
""",
    ),
    TopicSection(
      title: "Abstract Class vs Normal Class",
      content: """
Understanding the difference between a normal class and an abstract class is important.

Normal Class

• Objects can be created directly.
• Methods usually contain complete implementations.
• Can be used independently.

----------------------------------------

Abstract Class

• Objects cannot be created directly.
• May contain one or more abstract methods.
• Acts as a blueprint for child classes.
• Child classes must implement all abstract methods before objects can be created.

Normal classes are used to create objects, while abstract classes are used to define a common structure for other classes.
""",
    ),

    TopicSection(
      title: "Abstraction vs Encapsulation",
      content: """
Abstraction and Encapsulation are closely related but serve different purposes.

Abstraction focuses on hiding implementation details and showing only the essential features.

Example:
A car driver only uses the steering wheel, accelerator, and brake without knowing how the engine works internally.

----------------------------------------

Encapsulation focuses on protecting data by restricting direct access to it.

Example:
A bank account balance should only be modified using methods such as deposit() or withdraw() instead of directly changing the balance variable.

----------------------------------------

In simple words:

Abstraction answers:

"What can an object do?"

Encapsulation answers:

"How is the object's data protected?"
""",
    ),

    TopicSection(
      title: "Interfaces in Python",
      content: """
Unlike some programming languages, Python does not have a separate interface keyword.

Instead, interfaces are commonly implemented using Abstract Base Classes (ABC).

An abstract class containing only abstract methods behaves much like an interface because every child class must provide implementations for those methods.

This approach gives Python flexibility while still allowing developers to define common behavior for multiple classes.

Many professional Python applications use abstract classes to build interface-like designs.
""",
    ),

    TopicSection(
      title: "Advantages of Abstraction",
      content: """
Abstraction provides many benefits in software development.

• Reduces program complexity.
• Hides unnecessary implementation details.
• Makes code easier to understand.
• Improves maintainability.
• Encourages modular programming.
• Makes applications easier to extend.
• Increases security by exposing only required functionality.
• Allows internal implementation to change without affecting users.
• Promotes reusable software design.

Abstraction is one of the key principles that enables developers to build scalable and maintainable applications.
""",
    ),

    TopicSection(
      title: "Disadvantages of Abstraction",
      content: """
Although abstraction provides many advantages, it also has some limitations.

• Designing abstract classes requires careful planning.
• Too many abstract classes can make projects harder to understand.
• Beginners may initially find abstraction difficult.
• Improper abstraction may increase code complexity instead of reducing it.

These disadvantages can be minimized by keeping abstract classes simple and focused on a single responsibility.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while working with abstraction.

• Create abstract classes only when multiple child classes share common behavior.
• Keep abstract classes focused on one responsibility.
• Give abstract methods meaningful names.
• Avoid unnecessary abstract classes.
• Implement every abstract method in child classes.
• Use abstraction together with inheritance and polymorphism.
• Design abstract classes as reusable blueprints.

Good abstraction results in cleaner, more maintainable, and scalable software.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates an abstract class with multiple child classes implementing the same abstract method in different ways.
""",
      exampleCode: """
from abc import ABC, abstractmethod


class Animal(ABC):

    @abstractmethod
    def sound(self):
        pass


class Dog(Animal):

    def sound(self):
        print("Dog barks.")


class Cat(Animal):

    def sound(self):
        print("Cat meows.")


dog = Dog()
cat = Cat()

dog.sound()
cat.sound()
""",
      output: """
Dog barks.
Cat meows.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned one of the four pillars of Object-Oriented Programming—Abstraction.

You learned:

• What abstraction is.
• Why abstraction is important.
• Real-world examples of abstraction.
• Abstract Base Classes (ABC).
• Abstract methods.
• The @abstractmethod decorator.
• Creating and implementing abstract classes.
• Multiple abstract methods.
• Rules for abstract classes.
• Abstract class vs normal class.
• Abstraction vs encapsulation.
• Interfaces in Python.
• Advantages and disadvantages.
• Best practices.

Abstraction helps developers hide implementation details and expose only the essential functionality. It makes software easier to understand, maintain, and extend, making it one of the most important concepts in professional Python development.
""",
    ),
  ],
  quizQuestions: abstractionQuiz,
);