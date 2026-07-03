import 'package:python_quiz/data/quizzes/advanced/multiprocessing_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const multiprocessingTopic = Topic(
  title: "Multiprocessing",
  level: "Advanced",
  priority: 26,
  isRecommended: true,
  recommendationReason: "Leverage multiple CPU cores for faster execution.",
  sections: [
    TopicSection(
      title: "What is Multiprocessing?",
      content: """
Multiprocessing is a programming technique that allows multiple processes to run simultaneously.

A process is an independent program execution with its own memory space and system resources.

Unlike threads, processes do not share memory with each other. Each process runs independently, making multiprocessing safer for CPU-intensive tasks.

Python provides the built-in multiprocessing module to create and manage multiple processes.

Multiprocessing enables Python programs to fully utilize multiple CPU cores, allowing true parallel execution of tasks.
""",
    ),

    TopicSection(
      title: "Why Do We Need Multiprocessing?",
      content: """
Some applications perform computationally expensive tasks that require significant CPU time.

Examples include:

• Image processing
• Video rendering
• Machine learning
• Scientific simulations
• Data analysis
• Encryption

Running these tasks one after another can make applications slow.

Multiprocessing allows these tasks to execute in parallel on multiple CPU cores, significantly reducing execution time.

It is the preferred solution for CPU-bound applications.
""",
    ),

    TopicSection(
      title: "What is a Process?",
      content: """
A process is an independent execution of a program.

Each process has its own:

• Memory
• Variables
• Stack
• Heap
• System resources

Since processes do not share memory by default, one process cannot directly modify another process's data.

This isolation makes multiprocessing more secure and stable than multithreading, although it also requires more system resources.
""",
    ),

    TopicSection(
      title: "Process vs Thread",
      content: """
Processes and threads both allow concurrent execution, but they work differently.

Process

• Independent execution.
• Separate memory space.
• True parallel execution.
• Higher memory usage.
• More expensive to create.

----------------------------------------

Thread

• Runs inside a process.
• Shared memory.
• Lightweight.
• Faster communication.
• Best for I/O-bound tasks.

Use multiprocessing for CPU-bound work and multithreading for I/O-bound work.
""",
    ),

    TopicSection(
      title: "The Global Interpreter Lock (GIL)",
      content: """
One of the most important reasons for using multiprocessing in Python is the Global Interpreter Lock (GIL).

The GIL allows only one thread to execute Python bytecode at a time within a single process.

Because of the GIL, multithreading cannot fully utilize multiple CPU cores for CPU-intensive tasks.

Multiprocessing avoids this limitation because every process has its own Python interpreter and its own GIL.

This allows multiple processes to execute truly in parallel on different CPU cores.
""",
    ),

    TopicSection(
      title: "The multiprocessing Module",
      content: """
Python provides the multiprocessing module to create and manage processes.

The module contains several useful classes and functions, including:

• Process
• Queue
• Pipe
• Pool
• Lock
• Manager
• current_process()

These tools make it easier to build scalable applications that take advantage of multiple CPU cores.
""",
      syntax: """
import multiprocessing
""",
    ),

    TopicSection(
      title: "Creating Your First Process",
      content: """
A new process is created using the Process class.

The task to execute is provided through the target parameter.

After creating the process object, the start() method begins execution.

The new process runs independently of the main process.
""",
      syntax: """
process = multiprocessing.Process(
    target=function_name
)

process.start()
""",
      exampleCode: """
import multiprocessing


def task():
    print("Process is running.")


process = multiprocessing.Process(
    target=task
)

process.start()

process.join()
""",
      output: """
Process is running.
""",
    ),

    TopicSection(
      title: "The Main Process",
      content: """
Every Python program starts with a single process called the Main Process.

Additional processes are created from the Main Process.

The Main Process is responsible for creating child processes and usually waits for them to complete before the program exits.

Understanding the Main Process helps developers coordinate multiple processes correctly.
""",
      exampleCode: """
import multiprocessing


print(
    multiprocessing.current_process().name
)
""",
      output: """
MainProcess
""",
    ),
    TopicSection(
      title: "Starting a Process",
      content: """
Creating a process object does not immediately start a new process.

A process begins execution only after calling the start() method.

When start() is called, Python creates a new process and begins executing the function provided through the target parameter.

Each process executes independently of the main process.

Always call start() after creating a process object.
""",
      syntax: """
process.start()
""",
    ),

    TopicSection(
      title: "Waiting for a Process with join()",
      content: """
The join() method makes one process wait until another process has finished executing.

Without join(), the main process may continue running and even terminate before child processes complete their work.

Using join() ensures that child processes finish before the program proceeds to the next statement.

It is commonly used when the results of child processes are needed before continuing execution.
""",
      syntax: """
process.join()
""",
      exampleCode: """
import multiprocessing


def task():
    print("Child process running.")


process = multiprocessing.Process(target=task)

process.start()

process.join()

print("Main process finished.")
""",
      output: """
Child process running.
Main process finished.
""",
    ),

    TopicSection(
      title: "Process Lifecycle",
      content: """
Like threads, every process passes through several stages during its lifetime.

New

The process object is created.

----------------------------------------

Running

After calling start(), the operating system schedules the process for execution.

----------------------------------------

Waiting or Blocked

The process may pause while waiting for:

• File operations
• Network communication
• User input
• Other processes

----------------------------------------

Terminated

After completing its task, the process exits and releases its system resources.

Understanding the process lifecycle helps developers build efficient multiprocessing applications.
""",
    ),

    TopicSection(
      title: "Creating Multiple Processes",
      content: """
A multiprocessing application can create several child processes.

Each process executes independently and can run on a different CPU core.

Running multiple processes simultaneously significantly improves the performance of CPU-intensive applications.

Every process has its own memory and does not interfere with the execution of other processes.
""",
      exampleCode: """
import multiprocessing


def task(number):
    print(f"Process {number} is running.")


processes = []

for number in range(1, 4):
    process = multiprocessing.Process(
        target=task,
        args=(number,)
    )

    processes.append(process)
    process.start()

for process in processes:
    process.join()
""",
      output: """
Process 1 is running.
Process 2 is running.
Process 3 is running.
""",
    ),

    TopicSection(
      title: "Getting the Current Process",
      content: """
The current_process() function returns information about the process that is currently executing.

This is useful for debugging and monitoring multiprocessing applications.

Each process has a unique name that helps identify it during execution.
""",
      syntax: """
multiprocessing.current_process()
""",
      exampleCode: """
import multiprocessing


print(
    multiprocessing.current_process().name
)
""",
      output: """
MainProcess
""",
    ),

    TopicSection(
      title: "Process IDs (PID)",
      content: """
Every running process is assigned a unique Process ID (PID) by the operating system.

The PID uniquely identifies a process while it is running.

Developers often use Process IDs for debugging, monitoring, and system administration.

Python provides the os.getpid() function to retrieve the current process ID.
""",
      exampleCode: """
import os

print(os.getpid())
""",
      output: """
12345
""",
    ),

    TopicSection(
      title: "CPU-bound vs I/O-bound Tasks",
      content: """
Choosing between multithreading and multiprocessing depends on the type of task being performed.

CPU-bound Tasks

These tasks spend most of their time performing calculations.

Examples:

• Image processing
• Machine learning
• Mathematical computations
• Video rendering

Multiprocessing is the preferred solution because it can utilize multiple CPU cores.

----------------------------------------

I/O-bound Tasks

These tasks spend most of their time waiting for external resources.

Examples:

• Reading files
• Database operations
• Network requests
• Downloading data

Multithreading is usually a better choice because threads can continue working while waiting for input or output operations.
""",
    ),

    TopicSection(
      title: "Real-World Applications",
      content: """
Multiprocessing is commonly used in applications that require significant computational power.

Examples include:

• Machine learning
• Artificial intelligence
• Scientific computing
• Data analysis
• Video encoding
• Image processing
• Financial modeling
• Large-scale simulations
• Password hashing
• Big data processing

Whenever a program needs to perform CPU-intensive work efficiently, multiprocessing is often the preferred solution.
""",
    ),
    TopicSection(
      title: "Inter-Process Communication (IPC)",
      content: """
Processes have separate memory spaces, so they cannot directly share variables like threads.

To exchange data, processes use Inter-Process Communication (IPC).

Python's multiprocessing module provides several IPC mechanisms, including:

• Queue
• Pipe
• Manager

These tools allow processes to safely exchange information while remaining independent.

IPC is one of the most important concepts in multiprocessing because real-world applications often require processes to communicate with each other.
""",
    ),

    TopicSection(
      title: "Queue",
      content: """
A Queue is the most commonly used IPC mechanism.

It allows one process to place data into the queue while another process retrieves it.

Queues are thread-safe and process-safe, making them suitable for sharing information between multiple processes.

Data is processed in First-In, First-Out (FIFO) order.

Queues are widely used in task scheduling, producer-consumer systems, and background processing.
""",
      syntax: """
queue = multiprocessing.Queue()

queue.put(value)

queue.get()
""",
      exampleCode: """
import multiprocessing


def worker(queue):
    queue.put("Hello from child process")


queue = multiprocessing.Queue()

process = multiprocessing.Process(
    target=worker,
    args=(queue,)
)

process.start()

print(queue.get())

process.join()
""",
      output: """
Hello from child process
""",
    ),

    TopicSection(
      title: "Pipe",
      content: """
A Pipe provides direct communication between two processes.

Unlike a Queue, which supports multiple producers and consumers, a Pipe creates two connected endpoints.

Each endpoint can both send and receive data.

Pipes are useful when only two processes need to exchange information efficiently.
""",
      syntax: """
parent, child = multiprocessing.Pipe()

parent.send(value)

child.recv()
""",
      exampleCode: """
import multiprocessing


parent, child = multiprocessing.Pipe()

child.send("Python")

print(parent.recv())
""",
      output: """
Python
""",
    ),

    TopicSection(
      title: "Manager",
      content: """
A Manager allows multiple processes to safely share Python objects.

Using a Manager, processes can work with shared:

• Lists
• Dictionaries
• Sets
• Namespaces

The Manager automatically handles synchronization between processes.

It is useful when several processes need to read and modify the same data.
""",
      syntax: """
manager = multiprocessing.Manager()
""",
    ),

    TopicSection(
      title: "Process Pool",
      content: """
Creating many processes manually can become difficult in large applications.

Python provides the Pool class to simplify process management.

A process pool creates a fixed number of worker processes.

Tasks are automatically distributed among these workers.

Benefits include:

• Better resource utilization.
• Simpler code.
• Automatic process reuse.
• Improved scalability.

Process pools are commonly used for large computational workloads.
""",
      exampleCode: """
from multiprocessing import Pool


def square(number):
    return number * number


with Pool(processes=2) as pool:
    results = pool.map(square, [1, 2, 3])

print(results)
""",
      output: """
[1, 4, 9]
""",
    ),

    TopicSection(
      title: "ProcessPoolExecutor",
      content: """
Python also provides ProcessPoolExecutor in the concurrent.futures module.

It offers a higher-level interface for multiprocessing.

Compared to manually creating processes, ProcessPoolExecutor requires less code while automatically managing worker processes.

It is recommended for many modern Python applications because it is simple, readable, and reliable.
""",
      exampleCode: """
from concurrent.futures import ProcessPoolExecutor


def square(number):
    return number * number


with ProcessPoolExecutor() as executor:
    results = executor.map(square, [1, 2, 3])

for result in results:
    print(result)
""",
      output: """
1
4
9
""",
    ),

    TopicSection(
      title: "Advantages of Multiprocessing",
      content: """
Multiprocessing provides several important advantages.

• Achieves true parallel execution.
• Utilizes multiple CPU cores.
• Bypasses Python's Global Interpreter Lock (GIL).
• Ideal for CPU-intensive tasks.
• Provides better isolation because processes have separate memory.
• Improves application performance for computational workloads.
• Prevents one process from directly affecting another.

Multiprocessing is widely used in scientific computing, machine learning, and large-scale data processing.
""",
    ),

    TopicSection(
      title: "Disadvantages of Multiprocessing",
      content: """
Although multiprocessing is powerful, it also has some limitations.

• Higher memory usage.
• Processes take longer to create than threads.
• Communication between processes is slower.
• Shared data requires IPC mechanisms.
• Debugging multiple processes can be more difficult.

For simple or I/O-bound tasks, multithreading may be a better choice.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when using multiprocessing.

• Use multiprocessing for CPU-bound tasks.
• Use multithreading for I/O-bound tasks.
• Prefer ProcessPoolExecutor or Pool for multiple similar tasks.
• Minimize communication between processes.
• Share only the data that is necessary.
• Always wait for important processes using join().
• Avoid creating unnecessary processes.
• Keep process tasks independent whenever possible.

Following these practices leads to efficient, scalable, and maintainable multiprocessing applications.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example creates multiple processes to execute tasks in parallel.
""",
      exampleCode: """
import multiprocessing


def task(number):
    print(f"Process {number} is running.")


processes = []

for number in range(1, 4):
    process = multiprocessing.Process(
        target=task,
        args=(number,)
    )

    processes.append(process)
    process.start()

for process in processes:
    process.join()

print("All processes completed.")
""",
      output: """
Process 1 is running.
Process 2 is running.
Process 3 is running.
All processes completed.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about Multiprocessing, Python's solution for true parallel execution.

You learned:

• What multiprocessing is.
• Why multiprocessing is important.
• Processes and threads.
• The Global Interpreter Lock (GIL).
• The multiprocessing module.
• Creating and managing processes.
• The Main Process.
• Process lifecycle.
• start() and join().
• CPU-bound vs I/O-bound tasks.
• Inter-Process Communication (IPC).
• Queue, Pipe, and Manager.
• Process Pool.
• ProcessPoolExecutor.
• Advantages and disadvantages.
• Best practices.

Multiprocessing allows Python programs to fully utilize multiple CPU cores, making it the preferred solution for CPU-intensive workloads such as machine learning, scientific computing, image processing, and large-scale data analysis. Understanding multiprocessing is essential for building high-performance Python applications.
""",
    ),
  ],
  quizQuestions: multiprocessingQuiz,
);