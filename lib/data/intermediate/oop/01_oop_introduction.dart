import 'package:python_quiz/data/quizzes/intermediate/oop/oop_introduction_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const oopIntroductionTopic = Topic(
  title: "OOP Introduction",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "What is Object-Oriented Programming?",
      content: """
Object-Oriented Programming (OOP) is a programming paradigm that organizes code into objects instead of writing everything as separate functions.

An object represents a real-world entity that contains both data (attributes) and behavior (methods).

Unlike procedural programming, where data and functions are often kept separate, OOP combines them into a single unit called an object.

Python supports multiple programming paradigms, including Procedural Programming, Functional Programming, and Object-Oriented Programming. Although Python allows different programming styles, OOP is one of the most widely used approaches for building medium and large applications.

Object-Oriented Programming helps developers write programs that are easier to understand, organize, maintain, and extend.
""",
    ),

    TopicSection(
      title: "Why Was OOP Introduced?",
      content: """
As software applications become larger, managing hundreds or thousands of functions becomes difficult.

Procedural programming works well for small programs, but large applications often face problems such as:

• Code duplication
• Poor organization
• Difficult maintenance
• Tight coupling between data and functions
• Reduced code reusability

Object-Oriented Programming was introduced to solve these problems by organizing related data and functionality together inside objects.

This approach makes software easier to develop, test, and maintain.
""",
    ),

    TopicSection(
      title: "Procedural Programming vs Object-Oriented Programming",
      content: """
Procedural Programming organizes code around functions.

Example:

• create_account()
• deposit_money()
• withdraw_money()

Object-Oriented Programming organizes code around objects.

For example, instead of writing unrelated functions, a BankAccount object can contain:

Data

• Account Number
• Customer Name
• Balance

Behavior

• deposit()
• withdraw()
• check_balance()

Grouping related data and behavior together makes programs more structured and easier to understand.
""",
    ),

    TopicSection(
      title: "Real-World Analogy",
      content: """
Imagine a car manufacturing company.

Before building a car, engineers first design a blueprint.

The blueprint defines:

• Brand
• Color
• Engine Type
• Fuel Capacity
• Maximum Speed

It also defines what every car can do.

• Start
• Stop
• Accelerate
• Brake

The blueprint itself is not a real car.

Using that blueprint, the company manufactures thousands of actual cars.

Every car is different, but all are created using the same blueprint.

Similarly, in Object-Oriented Programming:

Blueprint → Class

Real Car → Object

You will learn about classes and objects in the next lesson.
""",
    ),

    TopicSection(
      title: "Advantages of OOP",
      content: """
Object-Oriented Programming provides many advantages.

• Better code organization
• Improved readability
• High code reusability
• Easier maintenance
• Better scalability
• Reduced code duplication
• Improved security through encapsulation
• Easier debugging
• Better collaboration among developers
• Models real-world entities naturally

These advantages make OOP one of the most popular programming paradigms in modern software development.
""",
    ),

    TopicSection(
      title: "Where is OOP Used?",
      content: """
Object-Oriented Programming is used in almost every software industry.

Some common applications include:

• Banking Systems
• Hospital Management Systems
• School Management Systems
• E-commerce Websites
• Social Media Applications
• Desktop Applications
• Mobile Applications
• Video Games
• Cloud Applications
• Artificial Intelligence
• Machine Learning
• Robotics
• Enterprise Software

Many popular Python frameworks such as Django, PyQt, TensorFlow, and many enterprise applications make extensive use of Object-Oriented Programming.
""",
    ),

    TopicSection(
      title: "The Four Pillars of OOP",
      content: """
Object-Oriented Programming is built upon four fundamental principles.

• Encapsulation
• Inheritance
• Polymorphism
• Abstraction

These principles help developers build software that is reusable, flexible, secure, and easy to maintain.

Each of these concepts will be explained in dedicated lessons later in this course.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned what Object-Oriented Programming is and why it is used.

You also learned:

• The difference between procedural programming and OOP.
• Why OOP was introduced.
• The advantages of OOP.
• Common applications of OOP.
• The four fundamental principles of OOP.

In the next lesson, you will learn about Classes and Objects, which form the foundation of Object-Oriented Programming.
""",
    ),
  ],
  quizQuestions: oopIntroductionQuiz,
);
