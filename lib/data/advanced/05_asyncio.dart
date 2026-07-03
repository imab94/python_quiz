import 'package:python_quiz/data/quizzes/advanced/asyncio_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const asyncioTopic = Topic(
  title: "Asyncio",
  level: "Advanced",
  priority: 27,
  isRecommended: true,
  recommendationReason: "Handle I/O operations without blocking your application.",
  sections: [
    TopicSection(
      title: "What is Asyncio?",
      content: """
Asyncio is Python's built-in library for writing asynchronous programs.

Instead of creating multiple threads or processes, asyncio allows a single thread to perform multiple tasks efficiently by switching between them whenever one task is waiting.

This technique is called asynchronous programming.

Asyncio is especially useful for applications that spend a lot of time waiting for external resources such as:

• Network requests
• Databases
• APIs
• Files
• Web servers

Because tasks cooperate with each other instead of blocking execution, applications remain responsive while using very little memory.
""",
    ),

    TopicSection(
      title: "Why Do We Need Asyncio?",
      content: """
Many applications spend more time waiting than actually performing computations.

For example, when downloading a web page, the program waits for data to arrive over the internet.

During this waiting period, the CPU is mostly idle.

Instead of waiting, asyncio allows the program to switch to another task.

When the first task becomes ready, execution continues from where it stopped.

This improves responsiveness and allows thousands of waiting operations to be handled efficiently using a single thread.
""",
    ),

    TopicSection(
      title: "Synchronous vs Asynchronous Programming",
      content: """
Understanding the difference between synchronous and asynchronous programming is important.

Synchronous Programming

• Tasks execute one after another.
• Each task must finish before the next one begins.
• Waiting operations block the program.

----------------------------------------

Asynchronous Programming

• Multiple tasks make progress together.
• Waiting operations do not block execution.
• While one task waits, another task can run.

Asynchronous programming is ideal for I/O-bound applications where waiting is common.
""",
    ),

    TopicSection(
      title: "When Should You Use Asyncio?",
      content: """
Asyncio is most effective for applications that perform many waiting operations.

Common examples include:

• Web servers
• REST APIs
• Chat applications
• Web scraping
• Download managers
• Database applications
• Network communication
• Real-time applications

Asyncio is generally not recommended for CPU-intensive calculations because those tasks benefit more from multiprocessing.
""",
    ),

    TopicSection(
      title: "The Event Loop",
      content: """
The Event Loop is the heart of asyncio.

It continuously checks which asynchronous tasks are ready to execute.

When one task starts waiting for an operation to complete, the Event Loop temporarily pauses it and switches to another ready task.

Once the waiting operation finishes, the Event Loop resumes the paused task.

This continuous scheduling allows many tasks to progress efficiently using a single thread.
""",
    ),

    TopicSection(
      title: "What is a Coroutine?",
      content: """
A coroutine is a special function that can pause and later resume its execution.

Unlike a normal function, a coroutine does not necessarily finish immediately.

Coroutines are defined using the async keyword.

Inside a coroutine, the await keyword is used whenever the coroutine must wait for another asynchronous operation.

Coroutines are the basic building blocks of asyncio applications.
""",
      syntax: """
async def function_name():
    statements
""",
      exampleCode: """
import asyncio


async def greet():
    print("Hello, Python!")


asyncio.run(greet())
""",
      output: """
Hello, Python!
""",
    ),

    TopicSection(
      title: "The async Keyword",
      content: """
The async keyword is placed before the def keyword to declare a coroutine.

This tells Python that the function may pause during execution and should be managed by the Event Loop.

Calling an async function does not immediately execute it.

Instead, it returns a coroutine object that must be executed by the Event Loop using asyncio.run() or by another coroutine using await.
""",
      syntax: """
async def function_name():
    statements
""",
    ),

    TopicSection(
      title: "Running a Coroutine",
      content: """
The asyncio.run() function starts the Event Loop and executes a coroutine.

For most programs, asyncio.run() is the main entry point for asynchronous execution.

It automatically creates the Event Loop, runs the coroutine, and closes the loop after completion.

Only one asyncio.run() call should normally exist in a program.
""",
      syntax: """
asyncio.run(coroutine())
""",
      exampleCode: """
import asyncio


async def main():
    print("Async program started.")


asyncio.run(main())
""",
      output: """
Async program started.
""",
    ),
    TopicSection(
      title: "The await Keyword",
      content: """
The await keyword is used inside a coroutine to pause its execution until another asynchronous operation completes.

While one coroutine is waiting, the Event Loop switches to another coroutine that is ready to run.

This allows multiple tasks to make progress without blocking the entire program.

The await keyword can only be used inside an async function.

Trying to use await in a normal function results in a syntax error.

Using await correctly is one of the most important parts of writing asynchronous Python programs.
""",
      syntax: """
result = await coroutine()
""",
      exampleCode: """
import asyncio


async def greet():
    await asyncio.sleep(1)
    print("Hello, Python!")


asyncio.run(greet())
""",
      output: """
Hello, Python!
""",
    ),

    TopicSection(
      title: "Using asyncio.sleep()",
      content: """
The asyncio.sleep() function pauses a coroutine without blocking the Event Loop.

Unlike time.sleep(), which blocks the entire thread, asyncio.sleep() allows other coroutines to continue running.

This makes asynchronous programs much more efficient when they spend time waiting.

Always use asyncio.sleep() instead of time.sleep() inside asynchronous programs.
""",
      syntax: """
await asyncio.sleep(seconds)
""",
      exampleCode: """
import asyncio


async def task():
    print("Task started.")

    await asyncio.sleep(2)

    print("Task completed.")


asyncio.run(task())
""",
      output: """
Task started.
Task completed.
""",
    ),

    TopicSection(
      title: "Running Multiple Coroutines",
      content: """
One of asyncio's biggest advantages is its ability to execute multiple coroutines concurrently.

Instead of waiting for one coroutine to finish before starting another, the Event Loop switches between them whenever they are waiting.

This allows applications to handle many independent tasks efficiently using a single thread.

Concurrent execution improves responsiveness for I/O-bound applications.
""",
    ),

    TopicSection(
      title: "Creating Tasks",
      content: """
A Task is a wrapper around a coroutine that schedules it to run independently.

Tasks allow multiple coroutines to execute concurrently.

Python provides the create_task() function to create tasks.

After a task is created, the Event Loop manages its execution automatically.
""",
      syntax: """
task = asyncio.create_task(
    coroutine()
)
""",
      exampleCode: """
import asyncio


async def download():
    print("Downloading...")


async def main():
    task = asyncio.create_task(download())

    await task


asyncio.run(main())
""",
      output: """
Downloading...
""",
    ),

    TopicSection(
      title: "Waiting for Multiple Tasks",
      content: """
Applications often need to wait for several asynchronous tasks to finish.

Instead of waiting for each task individually, asyncio provides functions that wait for multiple tasks together.

This allows several operations to run concurrently while the program waits for all of them to complete.

This approach is commonly used in web servers, APIs, and network applications.
""",
    ),

    TopicSection(
      title: "The asyncio.gather() Function",
      content: """
The asyncio.gather() function runs multiple coroutines concurrently and waits until all of them complete.

It returns the results in the same order that the coroutines were provided.

Using gather() is one of the simplest ways to execute several asynchronous operations at the same time.
""",
      syntax: """
await asyncio.gather(
    coroutine1(),
    coroutine2()
)
""",
      exampleCode: """
import asyncio


async def task_one():
    print("Task One")


async def task_two():
    print("Task Two")


async def main():
    await asyncio.gather(
        task_one(),
        task_two()
    )


asyncio.run(main())
""",
      output: """
Task One
Task Two
""",
    ),

    TopicSection(
      title: "Concurrent Execution",
      content: """
Concurrency means multiple tasks make progress during the same period of time.

In asyncio, only one coroutine executes at any given moment.

Whenever a coroutine reaches an await statement, it voluntarily pauses.

The Event Loop immediately switches to another coroutine that is ready to execute.

Although tasks are not executing in parallel on multiple CPU cores, they appear to run simultaneously because execution switches rapidly between them.

This approach is highly efficient for I/O-bound workloads.
""",
    ),

    TopicSection(
      title: "Real-World Applications",
      content: """
Asyncio is widely used in modern Python applications.

Common applications include:

• REST APIs.
• Web servers.
• Chat applications.
• Real-time messaging.
• Web scraping.
• Download managers.
• Database clients.
• Network monitoring.
• Cloud services.
• Streaming applications.

These applications spend much of their time waiting for external resources, making asyncio an excellent choice.
""",
    ),
    TopicSection(
      title: "Async Generators",
      content: """
An async generator is a special type of generator that works with asynchronous programming.

Instead of using only the yield keyword, an async generator is declared using the async keyword and produces values asynchronously.

Async generators are useful when values become available over time, such as reading network data, streaming files, or receiving messages from a server.

Values from an async generator are consumed using the async for loop.

Async generators combine the benefits of generators and asynchronous programming.
""",
      syntax: """
async def generator():
    yield value
""",
      exampleCode: """
import asyncio


async def numbers():
    for number in range(1, 4):
        yield number


async def main():
    async for value in numbers():
        print(value)


asyncio.run(main())
""",
      output: """
1
2
3
""",
    ),

    TopicSection(
      title: "Async Context Managers",
      content: """
Just as normal context managers use the with statement, asynchronous programs can use async context managers.

An async context manager automatically manages resources during asynchronous execution.

Instead of implementing __enter__() and __exit__(), async context managers implement:

• __aenter__()
• __aexit__()

They are used with the async with statement.

Async context managers are commonly used with asynchronous database connections, network clients, and file operations.
""",
      syntax: """
async with expression:
    statements
""",
      exampleCode: """
import asyncio


class Database:

    async def __aenter__(self):
        print("Connected")
        return self

    async def __aexit__(
        self,
        exc_type,
        exc_value,
        traceback
    ):
        print("Disconnected")


async def main():
    async with Database():
        print("Executing query")


asyncio.run(main())
""",
      output: """
Connected
Executing query
Disconnected
""",
    ),

    TopicSection(
      title: "Asyncio vs Multithreading vs Multiprocessing",
      content: """
Python provides three different approaches for concurrent execution.

Asyncio

• Single thread.
• Uses an Event Loop.
• Best for I/O-bound tasks with many waiting operations.
• Very memory efficient.

----------------------------------------

Multithreading

• Multiple threads.
• Shared memory.
• Best for I/O-bound tasks.
• Limited by the Global Interpreter Lock (GIL).

----------------------------------------

Multiprocessing

• Multiple independent processes.
• Separate memory.
• Best for CPU-bound tasks.
• Supports true parallel execution.

Choosing the correct approach depends on the type of work your application performs.
""",
    ),

    TopicSection(
      title: "Advantages of Asyncio",
      content: """
Asyncio provides many advantages.

• Efficient for I/O-bound applications.
• Handles thousands of concurrent tasks.
• Uses very little memory.
• Avoids creating many threads.
• Improves application responsiveness.
• Excellent for network programming.
• Simplifies asynchronous workflows.
• Scales well for server applications.

Many modern Python web frameworks are built on top of asyncio.
""",
    ),

    TopicSection(
      title: "Disadvantages of Asyncio",
      content: """
Although asyncio is powerful, it also has some limitations.

• Not suitable for CPU-intensive tasks.
• Requires learning asynchronous programming concepts.
• Existing synchronous libraries may not work directly.
• Debugging asynchronous code can be more challenging.
• Blocking functions can reduce performance if used incorrectly.

Understanding these limitations helps developers choose the right concurrency model.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while working with asyncio.

• Use asyncio for I/O-bound applications.
• Avoid blocking operations inside coroutines.
• Use asyncio.sleep() instead of time.sleep().
• Prefer asyncio.gather() for running multiple coroutines.
• Keep coroutines small and focused.
• Handle exceptions appropriately.
• Avoid unnecessary task creation.
• Use async context managers when working with asynchronous resources.

Following these practices leads to efficient and maintainable asynchronous applications.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example runs two coroutines concurrently using asyncio.gather().
""",
      exampleCode: """
import asyncio


async def task_one():
    await asyncio.sleep(1)
    print("Task One completed")


async def task_two():
    await asyncio.sleep(1)
    print("Task Two completed")


async def main():
    await asyncio.gather(
        task_one(),
        task_two()
    )


asyncio.run(main())
""",
      output: """
Task One completed
Task Two completed
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about Asyncio, Python's built-in framework for asynchronous programming.

You learned:

• What asyncio is.
• Why asynchronous programming is important.
• Synchronous vs asynchronous programming.
• The Event Loop.
• Coroutines.
• The async keyword.
• The await keyword.
• asyncio.run().
• asyncio.sleep().
• Tasks.
• asyncio.create_task().
• asyncio.gather().
• Async generators.
• Async context managers.
• Asyncio vs multithreading vs multiprocessing.
• Advantages and disadvantages.
• Best practices.

Asyncio allows Python applications to efficiently handle large numbers of I/O-bound operations without creating many threads or processes. It is widely used in web servers, APIs, networking, cloud applications, and real-time systems, making it an essential skill for modern Python developers.
""",
    ),
  ],
  quizQuestions: asyncioQuiz,
);