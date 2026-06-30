import 'package:python_quiz/data/quizzes/intermediate/decorator_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const decoratorsTopic = Topic(
  title: "Decorators",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "Introduction to Decorators",
      content: """
A decorator is a special function in Python that modifies or extends the behavior of another function or method without changing its original source code.

Decorators are one of Python's most powerful features and are widely used in web development, logging, authentication, caching, performance measurement, and many Python frameworks.

Instead of modifying an existing function directly, a decorator wraps the function and adds extra functionality before or after it executes.

This makes code cleaner, reusable, and easier to maintain.
""",
    ),

    TopicSection(
      title: "Why Use Decorators?",
      content: """
Suppose you have several functions that require the same functionality, such as:

• Logging
• Authentication
• Timing execution
• Input validation
• Exception handling

Without decorators, you would have to write the same code inside every function.

Decorators allow you to write that code once and reuse it for multiple functions.

Benefits:

• Reduces duplicate code
• Improves readability
• Promotes code reuse
• Makes maintenance easier
• Separates business logic from additional functionality
""",
    ),

    TopicSection(
      title: "Functions are First-Class Objects",
      content: """
Before learning decorators, it is important to understand that Python treats functions as first-class objects.

This means functions can:

• Be assigned to variables.
• Be passed as arguments.
• Be returned from other functions.
• Be stored inside data structures.

This capability makes decorators possible.
""",
      exampleCode: """
def greet():
    print("Hello!")

message = greet

message()
""",
      output: """
Hello!
""",
    ),

    TopicSection(
      title: "Creating a Simple Decorator",
      content: """
A decorator is simply a function that accepts another function as its parameter and returns a new function.

The returned function usually executes additional code before or after calling the original function.
""",
      syntax: """
def decorator(function):

    def wrapper():
        statements
        function()

    return wrapper
""",
      exampleCode: """
def decorator(function):

    def wrapper():
        print("Before function")
        function()
        print("After function")

    return wrapper


def greet():
    print("Hello!")

greet = decorator(greet)

greet()
""",
      output: """
Before function
Hello!
After function
""",
    ),

    TopicSection(
      title: "Using the @ Decorator Syntax",
      content: """
Python provides a shorter and cleaner way to apply decorators using the @ symbol.

Instead of writing:

function = decorator(function)

you can simply write:

@decorator

above the function definition.

Both approaches produce exactly the same result.
""",
      syntax: """
@decorator
def function_name():
    statements
""",
      exampleCode: """
def decorator(function):

    def wrapper():
        print("Before")
        function()
        print("After")

    return wrapper


@decorator
def greet():
    print("Hello!")

greet()
""",
      output: """
Before
Hello!
After
""",
    ),

    TopicSection(
      title: "Decorators with Arguments",
      content: """
Many functions accept parameters.

The wrapper function should also accept parameters so they can be forwarded to the original function.

This is usually done using *args and **kwargs.

*args receives positional arguments.

**kwargs receives keyword arguments.

This allows one decorator to work with almost any function.
""",
      syntax: """
def decorator(function):

    def wrapper(*args, **kwargs):
        return function(*args, **kwargs)

    return wrapper
""",
      exampleCode: """
def decorator(function):

    def wrapper(*args, **kwargs):
        print("Starting...")
        function(*args, **kwargs)
        print("Finished.")

    return wrapper


@decorator
def greet(name):
    print(f"Hello, {name}!")


greet("Arun")
""",
      output: """
Starting...
Hello, Arun!
Finished.
""",
    ),

    TopicSection(
      title: "Returning Values from Decorators",
      content: """
If the original function returns a value, the wrapper function should also return that value.

Otherwise, the returned result will be lost.

This is considered a best practice while writing decorators.
""",
      syntax: """
def wrapper(*args, **kwargs):
    return function(*args, **kwargs)
""",
      exampleCode: """
def decorator(function):

    def wrapper(*args, **kwargs):
        print("Calculating...")
        return function(*args, **kwargs)

    return wrapper


@decorator
def add(a, b):
    return a + b


result = add(10, 20)

print(result)
""",
      output: """
Calculating...
30
""",
    ),

    TopicSection(
      title: "Common Uses of Decorators",
      content: """
Decorators are widely used in professional Python applications.

Common use cases include:

• Logging
• Authentication
• Authorization
• Performance measurement
• Input validation
• Exception handling
• Caching
• Rate limiting
• Database transactions
• API request handling

Popular Python frameworks such as Django, Flask, and FastAPI make extensive use of decorators.
""",
    ),

    TopicSection(
      title: "Built-in Decorators",
      content: """
Python provides several built-in decorators.

Common examples include:

• @staticmethod
• @classmethod
• @property

These decorators modify the behavior of methods inside classes.

You have already seen @staticmethod and @classmethod while learning Object-Oriented Programming.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when writing decorators.

• Keep decorators focused on one responsibility.
• Use meaningful names.
• Always support *args and **kwargs.
• Return the original function's return value.
• Avoid unnecessary nesting.
• Use decorators to improve readability instead of adding complexity.

Decorators should simplify your code, not make it harder to understand.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates creating and using a decorator with the @ syntax.
""",
      exampleCode: """
def decorator(function):

    def wrapper():
        print("Program Started")
        function()
        print("Program Finished")

    return wrapper


@decorator
def display_message():
    print("Learning Python Decorators")


display_message()
""",
      output: """
Program Started
Learning Python Decorators
Program Finished
""",
    ),
  ],
  quizQuestions: decoratorsQuiz,
);
