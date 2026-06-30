import 'package:python_quiz/data/quizzes/advanced/context_managers_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const contextManagersTopic = Topic(
  title: "Context Managers",
  level: "Advanced",
  sections: [
    TopicSection(
      title: "What are Context Managers?",
      content: """
A Context Manager is a Python object that automatically manages resources while a block of code is executing.

Resources such as files, database connections, network sockets, and locks must be properly opened before use and closed afterward.

A context manager ensures that these resources are cleaned up automatically, even if an exception occurs during execution.

Python provides the with statement to work with context managers.

Using context managers makes programs safer, cleaner, and easier to maintain because developers no longer need to remember to manually release resources.
""",
    ),

    TopicSection(
      title: "Why Do We Need Context Managers?",
      content: """
Imagine opening a file to read data.

After finishing your work, the file should always be closed.

If you forget to close it, the operating system continues holding the resource, which may lead to resource leaks or prevent other programs from accessing the file.

The same problem exists for:

• Database connections
• Network sockets
• Thread locks
• External devices

Context managers solve this problem by automatically releasing resources after use, regardless of whether the code completes successfully or raises an exception.
""",
    ),

    TopicSection(
      title: "Resource Management",
      content: """
Resource management is the process of acquiring a resource before using it and releasing it afterward.

Common resources include:

• Files
• Database connections
• Network connections
• Thread locks
• API sessions

Every acquired resource should eventually be released.

Context managers automate this entire process, reducing bugs and making applications more reliable.
""",
    ),

    TopicSection(
      title: "The with Statement",
      content: """
The with statement is Python's preferred way of working with resources.

It automatically enters a context before executing a block of code and exits the context when the block finishes.

When execution leaves the with block, Python automatically performs any required cleanup.

This happens even if an exception occurs inside the block.

Because of this behavior, using the with statement is considered a Python best practice.
""",
      syntax: """
with expression as variable:
    statements
""",
      exampleCode: """
with open("student.txt", "w") as file:
    file.write("Hello, Python!")

print("File closed automatically.")
""",
      output: """
File closed automatically.
""",
    ),

    TopicSection(
      title: "Without vs With Context Manager",
      content: """
Before context managers were commonly used, programmers had to manually close resources.

Without Context Manager

• Open the resource.
• Perform the operation.
• Remember to close the resource.

If an exception occurred before close(), the resource might never be released.

----------------------------------------

With Context Manager

• Open the resource.
• Perform the operation.
• Python automatically closes the resource.

This approach produces cleaner, safer, and more reliable code.
""",
      exampleCode: """
# Without context manager

file = open("student.txt", "w")

file.write("Hello")

file.close()


# With context manager

with open("student.txt", "w") as file:
    file.write("Hello")
""",
    ),

    TopicSection(
      title: "How the with Statement Works",
      content: """
Although the with statement looks simple, Python performs several steps behind the scenes.

When execution enters the with block, Python calls the context manager's __enter__() method.

The value returned by __enter__() is assigned to the variable after the as keyword.

After the block finishes, Python automatically calls the __exit__() method.

This happens whether the block completes normally or an exception occurs.

This automatic setup and cleanup make context managers extremely reliable.
""",
    ),

    TopicSection(
      title: "Benefits of Context Managers",
      content: """
Context managers provide many benefits.

• Automatically release resources.
• Prevent resource leaks.
• Reduce boilerplate code.
• Improve readability.
• Handle exceptions safely.
• Simplify file handling.
• Improve application reliability.
• Encourage clean programming practices.

Most professional Python code uses context managers whenever resources need to be managed.
""",
    ),
    TopicSection(
      title: "The __enter__() Method",
      content: """
The __enter__() method is automatically called when execution enters a with block.

Its primary responsibility is to acquire or initialize the resource that will be used inside the block.

The value returned by __enter__() is assigned to the variable specified after the as keyword.

For example:

with resource as variable:

The variable receives the object returned by __enter__().

Every context manager must provide an __enter__() method.
""",
      syntax: """
def __enter__(self):
    return resource
""",
    ),

    TopicSection(
      title: "The __exit__() Method",
      content: """
The __exit__() method is automatically called when execution leaves the with block.

Its responsibility is to release or clean up the resource.

Python calls __exit__() whether:

• The block completes successfully.
• An exception occurs.

Because __exit__() always executes, it is the ideal place to close files, release locks, disconnect databases, or clean up other resources.

This automatic cleanup is one of the biggest advantages of context managers.
""",
      syntax: """
def __exit__(
    self,
    exception_type,
    exception_value,
    traceback
):
    pass
""",
    ),

    TopicSection(
      title: "Creating Your First Context Manager",
      content: """
A custom context manager is simply a class that implements both the __enter__() and __exit__() methods.

When the object is used inside a with statement, Python automatically calls these methods.

This allows your own classes to manage resources just like Python's built-in file objects.
""",
      exampleCode: """
class Demo:

    def __enter__(self):
        print("Entering context")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Exiting context")


with Demo():
    print("Inside with block")
""",
      output: """
Entering context
Inside with block
Exiting context
""",
    ),

    TopicSection(
      title: "Execution Flow of a Context Manager",
      content: """
Understanding the execution flow makes context managers much easier to understand.

When Python encounters a with statement, it performs these steps automatically.

1. Creates the context manager object.

2. Calls the __enter__() method.

3. Executes every statement inside the with block.

4. Calls the __exit__() method.

5. Releases the resource.

This sequence happens every time a context manager is used.
""",
    ),

    TopicSection(
      title: "Exception Handling in Context Managers",
      content: """
One of the greatest strengths of context managers is their ability to handle exceptions safely.

If an exception occurs inside the with block, Python still calls the __exit__() method before propagating the exception.

This guarantees that resources are released properly.

Without context managers, developers often had to write try-finally blocks manually to achieve the same behavior.
""",
      exampleCode: """
class Demo:

    def __enter__(self):
        print("Open Resource")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Close Resource")


with Demo():
    print(10 / 0)
""",
      output: """
Open Resource
Close Resource
Traceback (most recent call last):
...
ZeroDivisionError: division by zero
""",
    ),

    TopicSection(
      title: "Nested Context Managers",
      content: """
Python allows multiple context managers to be used together.

This is called nested context management.

Each context manager enters its own context before executing the block.

When execution finishes, Python exits the contexts in reverse order.

Nested context managers are commonly used when working with multiple files, database connections, or thread locks.
""",
      exampleCode: """
with open("file1.txt", "w") as file1:
    with open("file2.txt", "w") as file2:
        file1.write("Python")
        file2.write("Programming")
""",
    ),

    TopicSection(
      title: "Common Uses of Context Managers",
      content: """
Context managers are widely used throughout professional Python applications.

Some common uses include:

• Opening and closing files.
• Managing database connections.
• Acquiring and releasing thread locks.
• Managing network connections.
• Working with API sessions.
• Temporarily modifying program settings.
• Managing temporary files.

Whenever a resource must be acquired and later released, a context manager is usually the best solution.
""",
    ),
    TopicSection(
      title: "The contextlib Module",
      content: """
Python provides a built-in module called contextlib that makes it easier to create and work with context managers.

Instead of always writing classes with __enter__() and __exit__(), the contextlib module offers utilities that simplify context manager creation.

Some commonly used features include:

• contextmanager
• closing
• suppress
• ExitStack

The contextlib module is widely used in professional Python applications because it reduces boilerplate code while providing the same functionality.
""",
    ),

    TopicSection(
      title: "The @contextmanager Decorator",
      content: """
The @contextmanager decorator is provided by the contextlib module.

It allows you to create a context manager using a generator function instead of creating a class.

The code before the yield statement behaves like the __enter__() method.

The code after the yield statement behaves like the __exit__() method.

This approach is shorter, easier to read, and is commonly used when creating simple context managers.
""",
      syntax: """
from contextlib import contextmanager

@contextmanager
def manager():
    yield
""",
      exampleCode: """
from contextlib import contextmanager


@contextmanager
def message():

    print("Entering context")

    yield

    print("Exiting context")


with message():
    print("Inside with block")
""",
      output: """
Entering context
Inside with block
Exiting context
""",
    ),

    TopicSection(
      title: "Class-Based vs Function-Based Context Managers",
      content: """
Python supports two ways to create context managers.

Class-Based Context Manager

• Uses a class.
• Implements __enter__() and __exit__().
• Suitable for complex resource management.

----------------------------------------

Function-Based Context Manager

• Uses the @contextmanager decorator.
• Implemented using a generator function.
• Uses the yield keyword.
• Requires less code.
• Ideal for simple resource management.

Choose the approach that best fits the complexity of your application.
""",
    ),

    TopicSection(
      title: "Advantages of Context Managers",
      content: """
Context managers provide many advantages.

• Automatically release resources.
• Prevent resource leaks.
• Improve code readability.
• Reduce boilerplate code.
• Handle exceptions safely.
• Simplify file handling.
• Improve application reliability.
• Encourage clean and maintainable code.
• Reduce the chances of programming errors.

For these reasons, context managers are considered a Python best practice.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while working with context managers.

• Use the with statement whenever possible.
• Always manage files using context managers.
• Use custom context managers for resources that require setup and cleanup.
• Prefer @contextmanager for simple implementations.
• Keep __enter__() and __exit__() methods focused on resource management.
• Do not perform unrelated business logic inside context manager methods.
• Write meaningful names for custom context managers.

Following these practices results in cleaner, safer, and more maintainable Python programs.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates a custom class-based context manager that automatically performs setup and cleanup.
""",
      exampleCode: """
class DatabaseConnection:

    def __enter__(self):
        print("Connecting to database...")
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print("Closing database connection...")


with DatabaseConnection():
    print("Executing queries...")
""",
      output: """
Connecting to database...
Executing queries...
Closing database connection...
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about Context Managers, one of Python's most useful features for resource management.

You learned:

• What context managers are.
• Why context managers are important.
• Resource management.
• The with statement.
• How the with statement works.
• The __enter__() method.
• The __exit__() method.
• Creating custom context managers.
• Exception handling.
• Nested context managers.
• The contextlib module.
• The @contextmanager decorator.
• Class-based and function-based context managers.
• Advantages.
• Best practices.

Context managers automatically manage resources and ensure proper cleanup, making Python programs safer, cleaner, and more reliable. They are widely used for file handling, database connections, network communication, thread synchronization, and many other real-world applications.
""",
    ),
  ],
  quizQuestions: contextManagersQuiz,
);