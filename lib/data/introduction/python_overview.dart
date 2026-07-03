import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';
import '../quizzes/introduction/python_overview_quiz.dart';

const pythonOverviewTopic = Topic(
  title: "Python Overview",
  level: "Introduction",
  priority: 2,
  isRecommended: false,
  recommendationReason: "",
  sections: [
    TopicSection(
      title: "What is Python?",
      content: """
Python is a high-level, interpreted, and general-purpose programming language created by Guido van Rossum and first released in 1991.

Python was designed with simplicity and readability in mind, making it one of the easiest programming languages to learn while still being powerful enough to build large-scale applications.

Unlike low-level programming languages, Python uses a syntax that is close to the English language. This allows developers to focus more on solving problems rather than worrying about complex language rules.

Python is an interpreted language, which means programs are executed line by line without requiring compilation before execution. This makes development faster and debugging much easier.

Today, Python is one of the world's most popular programming languages and is used by beginners, software engineers, data scientists, researchers, and large technology companies.
""",
    ),

    TopicSection(
      title: "History of Python",
      content: """
Python was created by Guido van Rossum in the late 1980s while working at Centrum Wiskunde & Informatica (CWI) in the Netherlands.

The first official release of Python was version 0.9.0 in February 1991.

The name "Python" was inspired by the British comedy television series "Monty Python's Flying Circus", not by the snake.

Over the years, Python has evolved significantly.

Important milestones include:

• 1991 — Python 0.9.0 released.
• 2000 — Python 2.0 introduced.
• 2008 — Python 3.0 released with major improvements.
• Today — Python 3 is the standard version used worldwide.

Python continues to receive regular updates with improvements in performance, security, and developer productivity.
""",
    ),

    TopicSection(
      title: "Features of Python",
      content: """
Python offers many features that make it one of the most popular programming languages.

• Simple and easy-to-read syntax.
• Interpreted language.
• Cross-platform compatibility.
• Open-source and free to use.
• Object-Oriented Programming support.
• Large standard library.
• Dynamic typing.
• Automatic memory management.
• Extensive third-party packages.
• Excellent community support.
• Easy integration with other languages.
• Suitable for rapid application development.

These features make Python suitable for beginners as well as professional software development.
""",
    ),

    TopicSection(
      title: "Applications of Python",
      content: """
Python is used in almost every area of software development.

Some common applications include:

• Web Development
• Desktop Applications
• Data Science
• Machine Learning
• Artificial Intelligence
• Deep Learning
• Automation and Scripting
• Cybersecurity
• Cloud Computing
• Internet of Things (IoT)
• Scientific Computing
• Robotics
• Game Development
• DevOps
• API Development
• Financial Analysis
• Big Data Processing

Its versatility makes Python one of the most in-demand programming languages.
""",
    ),

    TopicSection(
      title: "Companies Using Python",
      content: """
Many of the world's leading technology companies rely on Python.

Some well-known companies include:

• Google
• Microsoft
• Netflix
• Instagram
• YouTube
• Spotify
• Dropbox
• Reddit
• Uber
• Pinterest
• NASA
• IBM
• Amazon
• Facebook (Meta)

These companies use Python for web services, automation, artificial intelligence, cloud computing, and data analysis.
""",
    ),

    TopicSection(
      title: "Advantages of Python",
      content: """
Python provides numerous advantages.

• Easy to learn.
• Beginner-friendly syntax.
• High developer productivity.
• Huge ecosystem of libraries.
• Excellent documentation.
• Strong community support.
• Platform independent.
• Highly versatile.
• Rapid development.
• Easy debugging.
• Supports multiple programming paradigms.

These advantages make Python an excellent choice for both small and enterprise-level applications.
""",
    ),

    TopicSection(
      title: "Limitations of Python",
      content: """
Although Python is extremely powerful, it also has some limitations.

• Slower execution compared to compiled languages like C++.
• Higher memory consumption.
• Not commonly used for mobile app development.
• Less suitable for low-level system programming.
• Global Interpreter Lock (GIL) can limit CPU-bound multithreading.

Despite these limitations, Python remains the preferred language for many modern software projects because of its simplicity and rich ecosystem.
""",
    ),

    TopicSection(
      title: "Why Learn Python?",
      content: """
Python is one of the best programming languages for beginners because its syntax is clean, readable, and easy to understand.

Learning Python opens opportunities in many career paths, including:

• Software Development
• Data Science
• Machine Learning
• Artificial Intelligence
• Automation
• Cybersecurity
• Cloud Computing
• Backend Development
• DevOps
• Data Engineering

Python skills are highly valued by employers, making it one of the most sought-after programming languages in the technology industry.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned the basics of Python.

You learned:

• What Python is.
• The history of Python.
• The key features of Python.
• Common applications of Python.
• Companies that use Python.
• Advantages and limitations of Python.
• Why Python is an excellent language to learn.

Python combines simplicity, power, and versatility, making it one of the best programming languages for beginners and professionals alike. It serves as the foundation for many modern technologies and is an excellent choice for building a successful career in software development.
""",
    ),
  ],
  quizQuestions: pythonOverviewQuiz,
);