import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';
import '../../quizzes/intermediate/oop/summary_oop_quiz.dart';

const oopSummaryTopic = Topic(
  title: "OOP Revision & Summary",
  level: "Intermediate",
  priority: 22,
  isRecommended: true,
  recommendationReason: "Strengthen your overall object-oriented skills.",
  sections: [
    TopicSection(
      title: "Complete OOP Revision",
      content: """
Congratulations! You have completed the entire Object-Oriented Programming module.

Let's quickly revise everything you have learned.

Object-Oriented Programming (OOP) is a programming paradigm that organizes software around objects instead of functions.

An object contains:

• Data (Attributes)
• Behavior (Methods)

Every object is created from a Class, which acts as a blueprint.

Python supports OOP completely and uses it extensively in frameworks like Django, Flask, TensorFlow, PyQt, FastAPI and many enterprise applications.

Mastering OOP is one of the most important skills for becoming a Python developer.
""",
    ),
    TopicSection(
      title: "Complete OOP Flow",
      content: """
The complete OOP learning path can be remembered like this:

Class
        ↓
Object
        ↓
Attributes
        ↓
Methods
        ↓
Constructor
        ↓
Instance Variables
        ↓
Class Variables
        ↓
Encapsulation
        ↓
Abstraction
        ↓
Inheritance
        ↓
Polymorphism
        ↓
Magic (Dunder) Methods

Understanding this flow makes learning advanced frameworks much easier.
""",
    ),
    TopicSection(
      title: "Four Pillars of OOP",
      content: """
Object-Oriented Programming is built upon four core principles.

1. Encapsulation
• Protects data
• Hides internal implementation
• Uses private variables

2. Abstraction
• Shows only essential details
• Hides unnecessary complexity

3. Inheritance
• Allows code reuse
• Child class inherits parent features

4. Polymorphism
• One interface
• Multiple implementations

These four concepts work together to produce clean, reusable and maintainable software.
""",
    ),
    TopicSection(
      title: "When Should You Use OOP?",
      content: """
Object-Oriented Programming is ideal when building:

• Banking Systems
• Hospital Management Systems
• School Management Systems
• E-commerce Applications
• REST APIs
• Desktop Applications
• Mobile Apps
• Games
• AI & Machine Learning Projects
• Enterprise Software

For very small scripts or simple automation tasks, procedural programming is often sufficient.

Choosing the right programming paradigm depends on the size and complexity of the project.
""",
    ),
    TopicSection(
      title: "Common Interview Questions",
      content: """
Frequently asked Python OOP interview questions include:

• What is OOP?
• Difference between Class and Object?
• What is self?
• What is __init__?
• Difference between Instance and Class Variables?
• Difference between @staticmethod and @classmethod?
• What is Encapsulation?
• What is Abstraction?
• Types of Inheritance?
• What is Method Overriding?
• What are Dunder Methods?
• Difference between Composition and Inheritance?

Being able to explain these concepts with examples is more important than memorizing definitions.
""",
    ),
    TopicSection(
      title: "OOP Best Practices",
      content: """
While writing Object-Oriented code:

• Keep classes focused on a single responsibility.
• Prefer composition when appropriate instead of deep inheritance.
• Avoid unnecessary public variables.
• Use meaningful class and method names.
• Write reusable and modular code.
• Follow Python naming conventions (PEP 8).
• Keep methods short and easy to understand.
• Document complex classes with docstrings.

Following these practices leads to clean, maintainable and scalable software.
""",
    ),
    TopicSection(
      title: "Summary",
      content: """
In this module, you learned the complete foundation of Object-Oriented Programming in Python.

You covered:

• OOP Fundamentals
• Classes & Objects
• self and Constructors
• Variables
• Methods
• Encapsulation
• Abstraction
• Inheritance
• Polymorphism
• Dunder Methods

With this knowledge, you are well prepared to build real-world Python applications and understand advanced frameworks that rely heavily on Object-Oriented Programming.

The next sections of this course will introduce more advanced Python concepts such as Context Managers, Logging, Multithreading, Multiprocessing, Asyncio, Memory Management, Testing, Design Patterns and Metaclasses.
""",
    ),
  ],
  quizQuestions: summaryOOPQuiz,
);