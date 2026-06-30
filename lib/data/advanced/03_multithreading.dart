import 'package:python_quiz/data/quizzes/advanced/multiprocessing_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const multithreadingTopic = Topic(
  title: "Multithreading",
  level: "Advanced",
  sections: [
    TopicSection(
      title: "What is Multithreading?",
      content: """
Multithreading is a programming technique that allows multiple threads to execute within the same process.

A thread is the smallest unit of execution inside a program.

Instead of performing one task at a time, multithreading allows several tasks to run concurrently.

For example, while one thread downloads data from the internet, another thread can update the user interface, and a third thread can save data to a file.

All threads inside a process share the same memory and resources, making communication between them fast and efficient.

Python provides the built-in threading module to create and manage threads.
""",
    ),

    TopicSection(
      title: "Why Do We Need Multithreading?",
      content: """
Many applications need to perform multiple tasks at the same time.

Imagine a web browser.

While you are reading a webpage, the browser may simultaneously:

• Download images.
• Play audio.
• Execute JavaScript.
• Respond to mouse clicks.

If these tasks were performed one after another, the browser would feel slow and unresponsive.

Multithreading improves responsiveness by allowing independent tasks to run concurrently.

It is especially useful for programs that spend time waiting for input or output operations such as files, databases, or network requests.
""",
    ),

    TopicSection(
      title: "What is a Thread?",
      content: """
A thread is the smallest unit of execution within a process.

Every Python program starts with one thread called the Main Thread.

Additional threads can be created to perform other tasks simultaneously.

Unlike processes, threads share the same memory space.

This allows threads to communicate quickly but also requires careful synchronization when multiple threads access shared data.
""",
    ),

    TopicSection(
      title: "Process vs Thread",
      content: """
Although processes and threads are related, they are different.

Process

• Independent program.
• Has its own memory.
• More expensive to create.
• Communication is slower.

----------------------------------------

Thread

• Runs inside a process.
• Shares memory with other threads.
• Faster to create.
• Communication is much faster.

One process may contain many threads working together.
""",
    ),

    TopicSection(
      title: "The threading Module",
      content: """
Python provides the built-in threading module for multithreading.

This module contains everything needed to create, start, and manage threads.

Some commonly used classes and functions include:

• Thread
• Lock
• RLock
• Semaphore
• current_thread()
• active_count()

The threading module is the primary tool for multithreaded programming in Python.
""",
      syntax: """
import threading
""",
    ),

    TopicSection(
      title: "Creating Your First Thread",
      content: """
A thread is created using the Thread class.

The task to be executed is passed using the target parameter.

After creating the thread, the start() method begins execution.

The thread runs independently of the main program.
""",
      syntax: """
thread = threading.Thread(
    target=function_name
)

thread.start()
""",
      exampleCode: """
import threading


def display_message():
    print("Thread is running.")


thread = threading.Thread(
    target=display_message
)

thread.start()

thread.join()
""",
      output: """
Thread is running.
""",
    ),

    TopicSection(
      title: "The Main Thread",
      content: """
Every Python program begins execution in a thread called the Main Thread.

When additional threads are created, they execute alongside the Main Thread.

The Main Thread is responsible for starting other threads and usually waits for them to finish before the program exits.

Understanding the Main Thread helps developers manage multiple threads correctly.
""",
      exampleCode: """
import threading


print(threading.current_thread().name)
""",
      output: """
MainThread
""",
    ),

    TopicSection(
      title: "Starting a Thread",
      content: """
Creating a thread object does not start execution.

A thread begins running only after calling the start() method.

Calling the run() method directly does not create a new thread.

Instead, it executes like a normal function inside the current thread.

Always use start() when you want true multithreading.
""",
    ),
    TopicSection(
      title: "Thread Lifecycle",
      content: """
Like a process, every thread passes through different stages during its lifetime.

New

The thread object is created but has not started execution.

----------------------------------------

Runnable

After calling the start() method, the thread becomes ready to run.

The operating system decides when the thread actually executes.

----------------------------------------

Running

The thread is currently executing its assigned task.

----------------------------------------

Waiting or Blocked

A thread may temporarily pause while waiting for:

• User input
• A file operation
• Network data
• Another thread

----------------------------------------

Terminated

Once the thread finishes its work, it enters the terminated state and cannot be started again.

Understanding the thread lifecycle helps developers manage multithreaded programs more effectively.
""",
    ),

    TopicSection(
      title: "Waiting for a Thread with join()",
      content: """
The join() method makes one thread wait until another thread finishes its execution.

Without join(), the main thread may continue executing while other threads are still running.

Using join() ensures that a thread completes its task before the program moves to the next statement.

This is especially useful when later operations depend on the results produced by another thread.
""",
      syntax: """
thread.join()
""",
      exampleCode: """
import threading


def task():
    print("Thread started.")
    print("Thread finished.")


thread = threading.Thread(target=task)

thread.start()

thread.join()

print("Main thread finished.")
""",
      output: """
Thread started.
Thread finished.
Main thread finished.
""",
    ),

    TopicSection(
      title: "Creating Multiple Threads",
      content: """
A program can create multiple threads to perform different tasks simultaneously.

Each thread executes independently while sharing the same process memory.

Creating multiple threads improves responsiveness, especially when tasks spend time waiting for files, databases, or network operations.

Python manages all running threads together inside the same process.
""",
      exampleCode: """
import threading


def task(number):
    print(f"Thread {number} is running.")


thread1 = threading.Thread(target=task, args=(1,))
thread2 = threading.Thread(target=task, args=(2,))
thread3 = threading.Thread(target=task, args=(3,))

thread1.start()
thread2.start()
thread3.start()

thread1.join()
thread2.join()
thread3.join()
""",
      output: """
Thread 1 is running.
Thread 2 is running.
Thread 3 is running.
""",
    ),

    TopicSection(
      title: "Daemon Threads",
      content: """
A daemon thread is a background thread that automatically stops when the main program exits.

Daemon threads are commonly used for background tasks such as:

• Monitoring files.
• Cleaning temporary data.
• Logging.
• Background services.

If only daemon threads remain, Python automatically terminates them when the main thread finishes.

Daemon threads should not be used for tasks that must always complete successfully.
""",
      syntax: """
thread.daemon = True
""",
      exampleCode: """
import threading
import time


def background_task():
    while True:
        print("Running...")
        time.sleep(1)


thread = threading.Thread(target=background_task)
thread.daemon = True

thread.start()

print("Main thread finished.")
""",
      output: """
Running...
Main thread finished.
""",
    ),

    TopicSection(
      title: "Getting the Current Thread",
      content: """
The current_thread() function returns the thread that is currently executing.

This is useful for debugging and understanding which thread is performing a particular task.

Each thread has its own name, which can be displayed using the name attribute.
""",
      syntax: """
threading.current_thread()
""",
      exampleCode: """
import threading


def task():
    print(threading.current_thread().name)


thread = threading.Thread(target=task)

thread.start()
thread.join()
""",
      output: """
Thread-1
""",
    ),

    TopicSection(
      title: "Counting Active Threads",
      content: """
The active_count() function returns the number of currently active threads.

The count includes the Main Thread and all additional running threads.

This function is useful for monitoring multithreaded applications.
""",
      syntax: """
threading.active_count()
""",
      exampleCode: """
import threading


print(threading.active_count())
""",
      output: """
1
""",
    ),

    TopicSection(
      title: "Listing Running Threads",
      content: """
The enumerate() function returns a list containing all currently active thread objects.

It can be used to inspect which threads are running at a given time.

This is especially useful while debugging multithreaded programs.
""",
      syntax: """
threading.enumerate()
""",
      exampleCode: """
import threading


for thread in threading.enumerate():
    print(thread.name)
""",
      output: """
MainThread
""",
    ),

    TopicSection(
      title: "Naming Threads",
      content: """
Every thread has a name.

Providing meaningful thread names makes debugging much easier, especially in large applications with many running threads.

Instead of using automatically generated names, developers can assign descriptive names while creating threads.
""",
      exampleCode: """
import threading


def task():
    print(threading.current_thread().name)


thread = threading.Thread(
    target=task,
    name="DownloadThread"
)

thread.start()
thread.join()
""",
      output: """
DownloadThread
""",
    ),

    TopicSection(
      title: "Real-World Applications",
      content: """
Multithreading is widely used in modern software.

Some common applications include:

• Download managers.
• Web browsers.
• Chat applications.
• File uploads and downloads.
• Network communication.
• Background logging.
• GUI applications.
• Games.
• Monitoring systems.
• Web servers.

Multithreading improves application responsiveness by allowing multiple independent tasks to run concurrently.
""",
    ),
    TopicSection(
      title: "Thread Synchronization",
      content: """
When multiple threads access the same shared resource at the same time, unexpected results may occur.

Thread synchronization is the process of coordinating multiple threads so that shared resources are accessed safely.

Without synchronization, different threads may overwrite each other's work or read inconsistent data.

Python provides several synchronization mechanisms, including:

• Lock
• RLock
• Semaphore

These tools help ensure that only one or a limited number of threads can access shared resources at a time.
""",
    ),

    TopicSection(
      title: "Race Condition",
      content: """
A race condition occurs when two or more threads access and modify the same shared data simultaneously.

Because the threads execute independently, the final result depends on the order in which they run.

Race conditions often produce incorrect or unpredictable results.

They are one of the most common problems in multithreaded programming.

Proper synchronization using locks can prevent race conditions.
""",
    ),

    TopicSection(
      title: "Lock",
      content: """
A Lock allows only one thread to access a shared resource at a time.

When a thread acquires the lock, other threads must wait until the lock is released.

Locks are commonly used to protect shared variables, files, and other critical resources.

Python provides the Lock class in the threading module.
""",
      syntax: """
lock = threading.Lock()

lock.acquire()

# Critical section

lock.release()
""",
      exampleCode: """
import threading

counter = 0
lock = threading.Lock()


def increment():
    global counter

    with lock:
        counter += 1


threads = []

for _ in range(5):
    thread = threading.Thread(target=increment)
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()

print(counter)
""",
      output: """
5
""",
    ),

    TopicSection(
      title: "RLock (Reentrant Lock)",
      content: """
An RLock, or Reentrant Lock, works similarly to a normal Lock but allows the same thread to acquire the lock multiple times.

A regular Lock would block if the same thread tried to acquire it again.

RLock is useful when functions that already hold a lock call other functions that also require the same lock.

Python provides the RLock class in the threading module.
""",
      syntax: """
lock = threading.RLock()
""",
    ),

    TopicSection(
      title: "Semaphore",
      content: """
A Semaphore allows a fixed number of threads to access a shared resource simultaneously.

Unlike a Lock, which allows only one thread, a semaphore can allow multiple threads at the same time.

Semaphores are useful when working with limited resources such as:

• Database connections
• Network connections
• Printer access
• Resource pools

Python provides the Semaphore class in the threading module.
""",
      syntax: """
semaphore = threading.Semaphore(2)
""",
    ),

    TopicSection(
      title: "Deadlock",
      content: """
A deadlock occurs when two or more threads wait indefinitely for each other to release resources.

As a result, none of the threads can continue executing.

Deadlocks can make an application appear frozen.

To reduce the risk of deadlocks:

• Acquire locks in a consistent order.
• Keep critical sections small.
• Release locks as soon as possible.
• Avoid holding multiple locks unnecessarily.
""",
    ),

    TopicSection(
      title: "ThreadPoolExecutor",
      content: """
Creating many threads manually can make programs difficult to manage.

Python provides ThreadPoolExecutor in the concurrent.futures module.

A thread pool creates a fixed number of worker threads and automatically assigns tasks to them.

Benefits include:

• Simpler code.
• Better thread management.
• Improved performance.
• Automatic thread reuse.

Thread pools are recommended for many real-world multithreaded applications.
""",
      exampleCode: """
from concurrent.futures import ThreadPoolExecutor


def square(number):
    return number * number


with ThreadPoolExecutor(max_workers=3) as executor:
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
      title: "Advantages of Multithreading",
      content: """
Multithreading provides several advantages.

• Improves application responsiveness.
• Allows multiple tasks to run concurrently.
• Makes better use of waiting time during input/output operations.
• Simplifies background processing.
• Improves the user experience.
• Supports efficient task scheduling.

Multithreading is especially useful for I/O-bound applications.
""",
    ),

    TopicSection(
      title: "Disadvantages of Multithreading",
      content: """
Although multithreading offers many benefits, it also introduces challenges.

• Race conditions.
• Deadlocks.
• Increased program complexity.
• Difficult debugging.
• Shared memory issues.
• Python's Global Interpreter Lock (GIL) limits true parallel execution of CPU-bound threads.

Understanding these challenges helps developers write safer multithreaded programs.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when using multithreading.

• Use threads mainly for I/O-bound tasks.
• Protect shared resources with locks.
• Keep critical sections as short as possible.
• Avoid unnecessary shared data.
• Use meaningful thread names.
• Prefer ThreadPoolExecutor when managing many threads.
• Always wait for important threads using join().
• Avoid creating excessive numbers of threads.

Following these practices leads to safer and more maintainable multithreaded applications.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example creates multiple threads that execute the same task concurrently.
""",
      exampleCode: """
import threading


def task(number):
    print(f"Thread {number} is running.")


threads = []

for number in range(1, 4):
    thread = threading.Thread(
        target=task,
        args=(number,)
    )
    threads.append(thread)
    thread.start()

for thread in threads:
    thread.join()

print("All threads completed.")
""",
      output: """
Thread 1 is running.
Thread 2 is running.
Thread 3 is running.
All threads completed.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned the fundamentals of multithreading in Python.

You learned:

• What multithreading is.
• Threads and processes.
• The threading module.
• Creating and starting threads.
• The Main Thread.
• Thread lifecycle.
• join().
• Daemon threads.
• Thread synchronization.
• Race conditions.
• Lock, RLock, and Semaphore.
• Deadlocks.
• ThreadPoolExecutor.
• Advantages and disadvantages.
• Best practices.

Multithreading enables Python applications to perform multiple tasks concurrently, making programs more responsive and efficient for I/O-bound workloads. Understanding synchronization techniques is essential for writing safe and reliable multithreaded applications.
""",
    ),
  ],
  quizQuestions: multiprocessingQuiz,
);