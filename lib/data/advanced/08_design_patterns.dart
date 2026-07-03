import 'package:python_quiz/data/quizzes/advanced/design_patterns_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const designPatternsTopic = Topic(
  title: "Design Patterns",
  level: "Advanced",
  priority: 30,
  isRecommended: true,
  recommendationReason: "Solve common software design problems with proven solutions.",
  sections: [
    TopicSection(
      title: "What are Design Patterns?",
      content: """
Design Patterns are proven, reusable solutions to common software design problems.

They are not complete programs or libraries.

Instead, they provide general guidelines for organizing classes and objects to solve recurring design challenges.

Design patterns help developers build software that is easier to understand, maintain, extend, and reuse.

They represent years of experience gathered by software engineers and are widely used in professional software development.
""",
    ),

    TopicSection(
      title: "Why Do We Need Design Patterns?",
      content: """
As software projects grow larger, writing clean and maintainable code becomes more difficult.

Without proper design, applications often become tightly coupled, difficult to modify, and harder to test.

Design patterns help solve these problems by providing well-established approaches for structuring software.

Benefits include:

• Improved code organization.
• Better maintainability.
• Increased code reuse.
• Easier testing.
• Reduced coupling.
• Improved scalability.
• Easier collaboration among developers.

Using design patterns allows developers to solve common problems in a consistent and reliable way.
""",
    ),

    TopicSection(
      title: "History of Design Patterns",
      content: """
Design patterns became popular after the publication of the book "Design Patterns: Elements of Reusable Object-Oriented Software" in 1994.

The authors are commonly known as the Gang of Four (GoF):

• Erich Gamma
• Richard Helm
• Ralph Johnson
• John Vlissides

The book introduced 23 classic design patterns that continue to influence modern software development.

Although programming languages have evolved, these patterns remain valuable because they describe reusable design principles rather than language-specific code.
""",
    ),

    TopicSection(
      title: "Categories of Design Patterns",
      content: """
The Gang of Four grouped design patterns into three categories.

----------------------------------------

Creational Patterns

Focus on object creation.

Examples:

• Singleton
• Factory Method
• Builder

----------------------------------------

Structural Patterns

Focus on organizing classes and objects.

Examples:

• Adapter
• Decorator
• Facade

----------------------------------------

Behavioral Patterns

Focus on communication between objects.

Examples:

• Observer
• Strategy
• Command

Understanding these categories helps developers choose the appropriate pattern for different design problems.
""",
    ),

    TopicSection(
      title: "When Should You Use Design Patterns?",
      content: """
Design patterns should be used when they solve a real design problem.

They are especially useful in:

• Large applications.
• Enterprise software.
• Framework development.
• Library development.
• APIs.
• Games.
• Desktop applications.
• Web applications.

For very small programs, introducing design patterns may add unnecessary complexity.

Always choose the simplest solution that meets the application's requirements.
""",
    ),

    TopicSection(
      title: "Design Patterns are Not Rules",
      content: """
Design patterns are recommendations, not strict rules.

A design pattern should only be applied when it genuinely improves the design of an application.

Using a pattern unnecessarily can make code more complicated instead of simpler.

Experienced developers choose patterns based on the specific problem they are solving rather than trying to use patterns everywhere.

Good software design is about writing clear, maintainable, and understandable code.
""",
    ),

    TopicSection(
      title: "Real-World Examples",
      content: """
Design patterns appear in many real-world systems.

Singleton

• Printer spooler.
• Configuration manager.
• Application logger.

----------------------------------------

Factory Method

• Creating different payment methods.
• Creating different database connections.

----------------------------------------

Observer

• YouTube notifications.
• Stock market updates.
• Chat applications.

----------------------------------------

Strategy

• Different payment methods.
• Different sorting algorithms.
• Different authentication mechanisms.

These examples show how design patterns solve common software problems in everyday applications.
""",
    ),

    TopicSection(
      title: "Overview of the Most Common Patterns",
      content: """
In this lesson, you will learn some of the most widely used design patterns in Python.

Creational

• Singleton
• Factory Method
• Builder

Structural

• Adapter
• Decorator
• Facade

Behavioral

• Observer
• Strategy
• Command

Each pattern solves a different design problem and has its own advantages and trade-offs.
""",
    ),
    TopicSection(
      title: "Creational Design Patterns",
      content: """
Creational Design Patterns focus on object creation.

Instead of creating objects directly throughout an application, these patterns provide flexible and reusable ways to create objects.

Benefits of creational patterns include:

• Reduced coupling.
• Better code reuse.
• Improved flexibility.
• Easier maintenance.
• Simplified object creation.

The three most commonly used creational patterns are:

• Singleton
• Factory Method
• Builder
""",
    ),

    TopicSection(
      title: "Singleton Pattern",
      content: """
The Singleton Pattern ensures that only one instance of a class exists throughout the application's lifetime.

Whenever an object of the class is requested, the same instance is returned instead of creating a new one.

Singletons are useful when exactly one shared object should control a resource or maintain application-wide state.

Common use cases include:

• Configuration manager.
• Logger.
• Database connection manager.
• Cache manager.
• Application settings.
""",
      exampleCode: """
class Singleton:

    _instance = None

    def __new__(cls):

        if cls._instance is None:
            cls._instance = super().__new__(cls)

        return cls._instance


object1 = Singleton()
object2 = Singleton()

print(object1 is object2)
""",
      output: """
True
""",
    ),

    TopicSection(
      title: "Advantages and Disadvantages of Singleton",
      content: """
Advantages

• Only one object is created.
• Saves memory.
• Provides a global access point.
• Useful for shared resources.
• Prevents inconsistent state.

----------------------------------------

Disadvantages

• Introduces global state.
• Can make testing more difficult.
• Reduces flexibility.
• May create hidden dependencies between classes.

Singleton should be used only when exactly one shared instance is required.
""",
    ),

    TopicSection(
      title: "Factory Method Pattern",
      content: """
The Factory Method Pattern creates objects without exposing the exact object creation process to the client.

Instead of creating objects directly using class constructors, object creation is delegated to a factory method.

The client only requests an object.

The factory decides which object should be created.

This reduces coupling between object creation and object usage.
""",
    ),

    TopicSection(
      title: "Factory Method Example",
      content: """
Suppose an application supports multiple payment methods.

Instead of directly creating payment objects throughout the application, a factory creates the appropriate object based on the user's choice.

The client only requests a payment object without knowing which class is actually instantiated.
""",
      exampleCode: """
class CreditCard:

    def pay(self):
        print("Paid using Credit Card.")


class UPI:

    def pay(self):
        print("Paid using UPI.")


class PaymentFactory:

    @staticmethod
    def create(method):

        if method == "card":
            return CreditCard()

        return UPI()


payment = PaymentFactory.create("card")

payment.pay()
""",
      output: """
Paid using Credit Card.
""",
    ),

    TopicSection(
      title: "Advantages of Factory Method",
      content: """
Factory Method offers several benefits.

• Hides object creation logic.
• Reduces coupling.
• Improves scalability.
• Makes code easier to maintain.
• New object types can be added without modifying existing client code.

Factory Method is widely used in frameworks and libraries where different implementations may be created dynamically.
""",
    ),

    TopicSection(
      title: "Builder Pattern",
      content: """
The Builder Pattern constructs complex objects step by step.

Instead of passing many constructor arguments at once, the object is built gradually.

The same building process can produce different representations of an object.

Builder is especially useful when objects contain many optional properties or require several configuration steps before they are ready to use.
""",
    ),

    TopicSection(
      title: "Builder Pattern Example",
      content: """
Imagine creating a computer.

Some computers may contain:

• SSD
• Graphics Card
• Extra RAM

Others may not.

Instead of creating many constructors for different combinations, the Builder Pattern constructs the computer step by step.
""",
      exampleCode: """
class Computer:

    def __init__(self):
        self.parts = []


class ComputerBuilder:

    def __init__(self):
        self.computer = Computer()

    def add_cpu(self):
        self.computer.parts.append("CPU")

    def add_ram(self):
        self.computer.parts.append("RAM")

    def build(self):
        return self.computer


builder = ComputerBuilder()

builder.add_cpu()
builder.add_ram()

computer = builder.build()

print(computer.parts)
""",
      output: """
['CPU', 'RAM']
""",
    ),

    TopicSection(
      title: "Comparison of Creational Patterns",
      content: """
Although all creational patterns deal with object creation, each serves a different purpose.

Singleton

• Ensures only one object exists.

----------------------------------------

Factory Method

• Decides which object should be created.

----------------------------------------

Builder

• Constructs complex objects step by step.

Choosing the correct creational pattern depends on the problem being solved.

Understanding these differences helps developers design flexible and maintainable applications.
""",
    ),
    TopicSection(
      title: "Structural Design Patterns",
      content: """
Structural Design Patterns focus on how classes and objects are organized to form larger, flexible structures.

Instead of creating new objects, these patterns define efficient ways for objects to work together.

Structural patterns improve code organization, reduce coupling, and make systems easier to extend.

Some of the most commonly used structural patterns are:

• Adapter
• Decorator
• Facade

These patterns are widely used in frameworks, libraries, and enterprise applications.
""",
    ),

    TopicSection(
      title: "Adapter Pattern",
      content: """
The Adapter Pattern allows two incompatible classes or interfaces to work together.

It acts as a bridge between an existing class and the interface expected by another class.

Instead of modifying existing code, an adapter converts one interface into another.

The Adapter Pattern is useful when integrating third-party libraries or legacy systems that use different interfaces.
""",
    ),

    TopicSection(
      title: "Adapter Pattern Example",
      content: """
Suppose an application expects a USB charger, but only a Type-C charger is available.

Instead of changing the application, an adapter converts the Type-C interface into a USB interface.

The application continues to work without modification.
""",
      exampleCode: """
class TypeCCharger:

    def charge_type_c(self):
        print("Charging using Type-C")


class Adapter:

    def __init__(self, charger):
        self.charger = charger

    def charge(self):
        self.charger.charge_type_c()


charger = TypeCCharger()

adapter = Adapter(charger)

adapter.charge()
""",
      output: """
Charging using Type-C
""",
    ),

    TopicSection(
      title: "Decorator Pattern",
      content: """
The Decorator Pattern adds new functionality to an object without modifying its original implementation.

Instead of changing the object's source code, a decorator wraps the object and extends its behavior.

Multiple decorators can be applied to the same object, allowing functionality to be added dynamically.

This follows the Open/Closed Principle because classes remain closed for modification but open for extension.
""",
    ),

    TopicSection(
      title: "Decorator Pattern Example",
      content: """
Suppose a coffee shop sells plain coffee.

Customers may optionally add:

• Milk
• Sugar
• Chocolate

Instead of creating separate classes for every possible combination, decorators add features one by one.

This keeps the design flexible and easy to extend.
""",
      exampleCode: """
class Coffee:

    def serve(self):
        print("Plain Coffee")


class MilkDecorator:

    def __init__(self, coffee):
        self.coffee = coffee

    def serve(self):
        self.coffee.serve()
        print("Added Milk")


coffee = Coffee()

decorated = MilkDecorator(coffee)

decorated.serve()
""",
      output: """
Plain Coffee
Added Milk
""",
    ),

    TopicSection(
      title: "Advantages of the Decorator Pattern",
      content: """
The Decorator Pattern provides several benefits.

• Adds functionality dynamically.
• Avoids modifying existing classes.
• Promotes code reuse.
• Supports combining multiple behaviors.
• Follows the Open/Closed Principle.

Decorator is widely used in Python frameworks and libraries to extend object behavior without changing existing code.
""",
    ),

    TopicSection(
      title: "Facade Pattern",
      content: """
The Facade Pattern provides a simple interface to a complex system.

Instead of interacting with many different classes, the client communicates with a single facade object.

The facade internally coordinates the work of multiple classes.

This simplifies application code and hides implementation details from users.
""",
    ),

    TopicSection(
      title: "Facade Pattern Example",
      content: """
Imagine starting a computer.

Internally, many operations occur:

• Power on.
• Load the operating system.
• Initialize hardware.
• Display the desktop.

Instead of performing each step manually, pressing the power button starts the entire process.

The power button acts as a facade by providing a simple interface to a complex system.
""",
      exampleCode: """
class CPU:

    def start(self):
        print("CPU started")


class Memory:

    def load(self):
        print("Memory loaded")


class Computer:

    def start(self):
        cpu = CPU()
        memory = Memory()

        cpu.start()
        memory.load()

        print("Computer ready")


computer = Computer()

computer.start()
""",
      output: """
CPU started
Memory loaded
Computer ready
""",
    ),

    TopicSection(
      title: "Comparison of Structural Patterns",
      content: """
Although structural patterns all improve object organization, each has a different purpose.

Adapter

• Converts one interface into another.

----------------------------------------

Decorator

• Adds new functionality without modifying existing code.

----------------------------------------

Facade

• Provides a simplified interface to a complex system.

Understanding these differences helps developers choose the most suitable structural pattern for a given problem.
""",
    ),
    TopicSection(
      title: "Behavioral Design Patterns",
      content: """
Behavioral Design Patterns focus on communication and interaction between objects.

Instead of concentrating on object creation or object structure, behavioral patterns define how objects collaborate to perform tasks efficiently.

These patterns help reduce coupling, improve flexibility, and make applications easier to extend.

Some of the most commonly used behavioral patterns include:

• Observer
• Strategy
• Command

Behavioral patterns are widely used in event-driven systems, user interfaces, games, and enterprise applications.
""",
    ),

    TopicSection(
      title: "Observer Pattern",
      content: """
The Observer Pattern defines a one-to-many relationship between objects.

When one object changes its state, all registered observers are automatically notified.

The object being observed is called the Subject.

The objects receiving updates are called Observers.

This pattern is commonly used for notifications and event handling.
""",
    ),

    TopicSection(
      title: "Observer Pattern Example",
      content: """
Suppose a YouTube channel uploads a new video.

The channel represents the Subject.

Subscribers represent the Observers.

Whenever a new video is uploaded, every subscriber automatically receives a notification.

The channel does not need to notify each subscriber individually.
""",
      exampleCode: """
class Subscriber:

    def update(self, message):
        print(message)


class Channel:

    def __init__(self):
        self.subscribers = []

    def subscribe(self, subscriber):
        self.subscribers.append(subscriber)

    def notify(self):
        for subscriber in self.subscribers:
            subscriber.update(
                "New video uploaded!"
            )


channel = Channel()

subscriber = Subscriber()

channel.subscribe(subscriber)

channel.notify()
""",
      output: """
New video uploaded!
""",
    ),

    TopicSection(
      title: "Strategy Pattern",
      content: """
The Strategy Pattern allows multiple algorithms to be defined separately and selected at runtime.

Instead of placing many if-else statements inside one class, each algorithm is implemented as a separate strategy.

The client chooses which strategy should be used.

This makes applications more flexible and easier to extend.
""",
    ),

    TopicSection(
      title: "Strategy Pattern Example",
      content: """
Imagine an online shopping application.

Customers may choose different payment methods such as:

• Credit Card
• UPI
• PayPal

Instead of placing every payment algorithm inside one class, each payment method becomes a separate strategy.

The application selects the appropriate strategy based on the user's choice.
""",
      exampleCode: """
class CreditCard:

    def pay(self):
        print("Paid using Credit Card")


class UPI:

    def pay(self):
        print("Paid using UPI")


payment = UPI()

payment.pay()
""",
      output: """
Paid using UPI
""",
    ),

    TopicSection(
      title: "Command Pattern",
      content: """
The Command Pattern converts a request into an object.

Instead of executing an action immediately, the request is stored inside a command object.

This allows commands to be queued, logged, undone, or executed later.

The Command Pattern is commonly used in text editors, GUI applications, and task scheduling systems.
""",
    ),

    TopicSection(
      title: "Command Pattern Example",
      content: """
Suppose a television remote controls a TV.

Pressing a button does not directly interact with the television.

Instead, each button creates a command object that tells the TV what action to perform.

Examples include:

• Power On
• Power Off
• Increase Volume
• Change Channel

This separates the user interface from the implementation.
""",
      exampleCode: """
class Light:

    def on(self):
        print("Light turned on")


class LightCommand:

    def __init__(self, light):
        self.light = light

    def execute(self):
        self.light.on()


light = Light()

command = LightCommand(light)

command.execute()
""",
      output: """
Light turned on
""",
    ),

    TopicSection(
      title: "Comparison of Behavioral Patterns",
      content: """
Although behavioral patterns all define interactions between objects, each solves a different problem.

Observer

• Notifies multiple objects when state changes.

----------------------------------------

Strategy

• Allows algorithms to be selected at runtime.

----------------------------------------

Command

• Encapsulates requests as objects.

Choosing the correct behavioral pattern depends on how objects need to communicate within an application.
""",
    ),

    TopicSection(
      title: "Choosing the Right Design Pattern",
      content: """
No single design pattern is suitable for every situation.

Choose a pattern based on the problem being solved.

Use:

• Singleton when only one object should exist.
• Factory Method when object creation should be hidden.
• Builder for constructing complex objects.
• Adapter to connect incompatible interfaces.
• Decorator to add functionality dynamically.
• Facade to simplify complex systems.
• Observer for notifications.
• Strategy for interchangeable algorithms.
• Command to encapsulate requests.

Selecting the appropriate pattern leads to cleaner, more maintainable software.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when using design patterns.

• Understand the problem before selecting a pattern.
• Do not use patterns unnecessarily.
• Prefer simplicity over complexity.
• Follow the SOLID principles.
• Write reusable and maintainable code.
• Keep classes focused on a single responsibility.
• Document complex designs for other developers.

Design patterns should improve software quality rather than make code harder to understand.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates the Strategy Pattern, where different payment methods can be selected without changing the application code.
""",
      exampleCode: """
class CreditCard:

    def pay(self):
        print("Credit Card Payment")


class UPI:

    def pay(self):
        print("UPI Payment")


def checkout(payment_method):
    payment_method.pay()


checkout(CreditCard())
checkout(UPI())
""",
      output: """
Credit Card Payment
UPI Payment
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned the fundamentals of Design Patterns in Python.

You learned:

• What design patterns are.
• Why design patterns are important.
• The history of design patterns.
• Creational, Structural, and Behavioral pattern categories.
• Singleton Pattern.
• Factory Method Pattern.
• Builder Pattern.
• Adapter Pattern.
• Decorator Pattern.
• Facade Pattern.
• Observer Pattern.
• Strategy Pattern.
• Command Pattern.
• Choosing the right design pattern.
• Best practices.

Design patterns provide proven solutions to common software design problems. They help developers build applications that are flexible, reusable, scalable, and easier to maintain. Understanding these patterns is an important step toward becoming a professional Python developer and software engineer.
""",
    ),
  ],
  quizQuestions: designPatternsQuiz,
);