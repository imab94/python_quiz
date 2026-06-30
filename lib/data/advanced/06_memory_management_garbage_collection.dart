import 'package:python_quiz/data/quizzes/advanced/memory_management_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const memoryManagementTopic = Topic(
  title: "Memory Management & Garbage Collection",
  level: "Advanced",
  sections: [
    TopicSection(
      title: "What is Memory Management?",
      content: """
Memory management is the process of allocating, using, and releasing memory while a program is running.

Whenever a Python program creates variables, objects, lists, dictionaries, or other data structures, Python automatically reserves memory for them.

When those objects are no longer needed, Python automatically frees their memory so it can be reused.

Unlike languages such as C or C++, Python developers do not normally allocate or free memory manually.

Instead, Python performs memory management automatically, making programs safer and reducing the chance of memory-related bugs.
""",
    ),

    TopicSection(
      title: "Why is Memory Management Important?",
      content: """
Every program uses computer memory.

If memory is never released after objects are no longer needed, the program continues consuming more and more memory.

Eventually, this can slow down the application or even cause it to crash.

Good memory management helps applications:

• Use memory efficiently.
• Improve performance.
• Prevent memory leaks.
• Handle large datasets.
• Remain stable during long execution.

Python's automatic memory management allows developers to focus on solving problems instead of manually managing memory.
""",
    ),

    TopicSection(
      title: "How Python Stores Data",
      content: """
Whenever a value is created, Python stores it somewhere in memory.

Variables do not actually store the values themselves.

Instead, a variable stores a reference to an object that exists in memory.

For example:

age = 25

The variable age refers to an integer object whose value is 25.

Multiple variables may refer to the same object at the same time.

Understanding references is essential for understanding Python's memory management.
""",
      exampleCode: """
number = 100

print(id(number))
""",
      output: """
140000000000000
""",
    ),

    TopicSection(
      title: "Objects and References",
      content: """
Everything in Python is an object.

Examples include:

• Integers
• Strings
• Lists
• Dictionaries
• Functions
• Classes

Variables simply hold references to these objects.

When multiple variables reference the same object, they all point to the same memory location.

Python automatically keeps track of these references so it knows when an object is no longer being used.
""",
      exampleCode: """
a = [1, 2, 3]

b = a

print(a is b)
""",
      output: """
True
""",
    ),

    TopicSection(
      title: "Memory Allocation",
      content: """
Memory allocation is the process of reserving memory for new objects.

Whenever a new object is created, Python automatically allocates enough memory to store it.

Examples include:

• Creating variables.
• Creating lists.
• Creating dictionaries.
• Creating class objects.
• Calling functions.

Python handles allocation automatically, so programmers rarely need to think about the underlying memory management process.
""",
    ),

    TopicSection(
      title: "Stack Memory",
      content: """
Stack memory stores information related to function execution.

It contains:

• Function calls.
• Local variables.
• Return addresses.

Whenever a function is called, Python creates a new stack frame.

When the function finishes, its stack frame is automatically removed.

Stack memory is managed automatically and is generally very fast.
""",
      exampleCode: """
def greet():

    message = "Hello"


greet()
""",
    ),

    TopicSection(
      title: "Heap Memory",
      content: """
Heap memory stores Python objects that may exist beyond a single function call.

Objects stored in heap memory include:

• Lists.
• Dictionaries.
• Sets.
• Class instances.
• Large strings.

Heap memory is automatically managed by Python's memory manager.

Most objects created during a program's execution live in heap memory.
""",
    ),

    TopicSection(
      title: "The id() Function",
      content: """
Every Python object has a unique identity while it exists in memory.

The built-in id() function returns this unique identifier.

The value returned by id() usually represents the memory address of the object in the current Python implementation.

Developers often use id() while learning references and object identity.
""",
      syntax: """
id(object)
""",
      exampleCode: """
language = "Python"

print(id(language))
""",
      output: """
140000000000000
""",
    ),
    TopicSection(
      title: "Reference Counting",
      content: """
Python primarily manages memory using Reference Counting.

Every object keeps track of how many variables or other objects currently reference it.

This number is called the reference count.

Whenever a new reference points to an object, the reference count increases.

Whenever a reference is removed, the reference count decreases.

When the reference count becomes zero, Python immediately deallocates the object's memory because nothing in the program can access it anymore.

Reference counting is Python's first and most frequently used memory management technique.
""",
      exampleCode: """
import sys


numbers = [1, 2, 3]

print(sys.getrefcount(numbers))
""",
      output: """
2
""",
    ),

    TopicSection(
      title: "Understanding Reference Counts",
      content: """
A reference count changes whenever references are created or removed.

For example:

Step 1

numbers = [1, 2, 3]

Reference Count = 1

----------------------------------------

Step 2

values = numbers

Reference Count = 2

----------------------------------------

Step 3

del values

Reference Count = 1

Python continuously updates these counts during program execution.

When the count reaches zero, the object becomes eligible for deletion.
""",
    ),

    TopicSection(
      title: "The sys.getrefcount() Function",
      content: """
The sys.getrefcount() function returns the current reference count of an object.

It is mainly used for learning and debugging.

One extra reference is temporarily created while passing the object as an argument to getrefcount(), so the returned value is usually one greater than expected.

Because of this behavior, developers rarely use getrefcount() in production code.
""",
      syntax: """
import sys

sys.getrefcount(object)
""",
    ),

    TopicSection(
      title: "What is Garbage Collection?",
      content: """
Garbage Collection is Python's automatic process for removing objects that are no longer needed.

Although reference counting removes most unused objects immediately, it cannot handle every situation.

Python therefore includes an additional Garbage Collector that periodically searches for unreachable objects and frees their memory.

Garbage Collection runs automatically in the background, allowing developers to write programs without manually releasing memory.

This automatic cleanup is one of Python's major advantages.
""",
    ),

    TopicSection(
      title: "Why is Garbage Collection Needed?",
      content: """
Reference counting works well in most situations.

However, it cannot remove objects involved in circular references.

In a circular reference, two or more objects reference each other.

Even if the program can no longer access them, their reference counts never reach zero.

Without a Garbage Collector, these objects would remain in memory forever.

Python's Garbage Collector detects these unreachable circular references and safely removes them.
""",
    ),

    TopicSection(
      title: "Circular References",
      content: """
A circular reference occurs when two or more objects reference each other.

For example:

Object A references Object B.

Object B references Object A.

Even after all external references are removed, both objects continue referencing each other.

Their reference counts never become zero.

Python's Garbage Collector periodically searches for these unreachable cycles and releases their memory automatically.
""",
      exampleCode: """
class Employee:
    pass


employee1 = Employee()
employee2 = Employee()

employee1.partner = employee2
employee2.partner = employee1
""",
    ),

    TopicSection(
      title: "The gc Module",
      content: """
Python provides the built-in gc module for interacting with the Garbage Collector.

The gc module allows developers to:

• Trigger garbage collection manually.
• Enable or disable the Garbage Collector.
• Inspect tracked objects.
• Debug memory-related issues.

In most applications, developers do not need to use the gc module because Python manages memory automatically.

However, it is useful for understanding how Python handles memory internally.
""",
      syntax: """
import gc
""",
    ),

    TopicSection(
      title: "Running Garbage Collection Manually",
      content: """
Although Python automatically performs garbage collection, developers can also trigger it manually.

The gc.collect() function immediately starts a garbage collection cycle.

This function is mainly useful for testing, debugging, or long-running applications where immediate cleanup is desirable.
""",
      syntax: """
gc.collect()
""",
      exampleCode: """
import gc


collected = gc.collect()

print(collected)
""",
      output: """
0
""",
    ),

    TopicSection(
      title: "Enabling and Disabling the Garbage Collector",
      content: """
Python allows the Garbage Collector to be temporarily disabled and enabled.

Useful functions include:

• gc.disable()
• gc.enable()

Disabling garbage collection is rarely necessary.

It is mainly used while benchmarking applications or investigating memory-related behavior.

For most programs, Python's default automatic garbage collection should remain enabled.
""",
      syntax: """
gc.disable()

gc.enable()
""",
    ),
    TopicSection(
      title: "The del Statement",
      content: """
The del statement is used to remove a reference to an object.

When a variable is deleted using del, Python removes that reference.

If no references to the object remain, its reference count becomes zero, making the object eligible for immediate memory deallocation.

It is important to understand that del removes the reference, not necessarily the object itself.

If other variables still reference the same object, the object remains in memory.
""",
      syntax: """
del variable_name
""",
      exampleCode: """
numbers = [10, 20, 30]

copy = numbers

del numbers

print(copy)
""",
      output: """
[10, 20, 30]
""",
    ),

    TopicSection(
      title: "Weak References",
      content: """
Normally, every reference to an object increases its reference count.

A weak reference is different.

It allows one object to refer to another without increasing its reference count.

Because weak references do not keep objects alive, the Garbage Collector can still remove the object when no strong references remain.

Python provides the weakref module for creating weak references.

Weak references are commonly used in caches, observers, and memory-sensitive applications.
""",
      syntax: """
import weakref
""",
      exampleCode: """
import weakref


class Student:
    pass


student = Student()

reference = weakref.ref(student)

print(reference())
""",
      output: """
<__main__.Student object at 0x...>
""",
    ),

    TopicSection(
      title: "Memory Leaks",
      content: """
A memory leak occurs when memory that is no longer useful is not released.

Although Python automatically manages memory, memory leaks can still occur.

Common causes include:

• Keeping unnecessary references.
• Large global variables.
• Objects stored in caches indefinitely.
• Circular references involving external resources.
• Objects that remain referenced throughout the program.

Memory leaks gradually increase memory usage and may eventually reduce application performance.

Writing clean code and removing unnecessary references helps prevent memory leaks.
""",
    ),

    TopicSection(
      title: "Object Lifetime",
      content: """
Every Python object has a lifetime.

The lifetime begins when the object is created.

While one or more references point to the object, it remains in memory.

Once all references are removed, the object becomes eligible for deletion.

If the object is part of a circular reference, Python's Garbage Collector eventually removes it during a garbage collection cycle.

Understanding object lifetime helps developers write memory-efficient applications.
""",
    ),

    TopicSection(
      title: "Python Memory Allocator (PyMalloc)",
      content: """
Python uses its own memory allocator called PyMalloc.

PyMalloc is optimized for allocating and releasing small Python objects efficiently.

Instead of requesting memory directly from the operating system every time an object is created, PyMalloc manages memory pools internally.

This reduces allocation overhead and improves application performance.

Most Python developers never interact with PyMalloc directly because it works automatically behind the scenes.
""",
    ),

    TopicSection(
      title: "Advantages of Automatic Memory Management",
      content: """
Python's automatic memory management provides several important advantages.

• No manual memory allocation.
• No manual memory deallocation.
• Reduced programming errors.
• Lower risk of dangling pointers.
• Improved developer productivity.
• Safer applications.
• Automatic garbage collection.
• Better reliability.

These features allow developers to focus on application logic rather than low-level memory management.
""",
    ),

    TopicSection(
      title: "Limitations of Automatic Memory Management",
      content: """
Although automatic memory management is very convenient, it also has some limitations.

• Garbage collection introduces a small performance overhead.
• Memory is not always released immediately.
• Circular references require additional garbage collection.
• Higher memory usage than some lower-level languages.
• Developers have less direct control over memory allocation.

Despite these limitations, Python's memory management system is suitable for most applications.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when writing memory-efficient Python programs.

• Remove unnecessary references.
• Avoid creating excessively large global variables.
• Reuse objects whenever practical.
• Release external resources promptly.
• Use context managers for files and database connections.
• Avoid unnecessary circular references.
• Use generators when processing large datasets.
• Monitor memory usage in long-running applications.

Following these practices helps applications remain efficient and stable.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates how reference counting works when references are created and removed.
""",
      exampleCode: """
import sys


numbers = [1, 2, 3]

print(sys.getrefcount(numbers))

copy = numbers

print(sys.getrefcount(numbers))

del copy

print(sys.getrefcount(numbers))
""",
      output: """
2
3
2
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned how Python automatically manages memory throughout the lifetime of a program.

You learned:

• What memory management is.
• Why memory management is important.
• Objects and references.
• Memory allocation.
• Stack memory.
• Heap memory.
• The id() function.
• Reference counting.
• sys.getrefcount().
• Garbage collection.
• Circular references.
• The gc module.
• gc.collect().
• gc.disable() and gc.enable().
• The del statement.
• Weak references.
• Memory leaks.
• Object lifetime.
• PyMalloc.
• Advantages and limitations of automatic memory management.
• Best practices.

Python's automatic memory management combines reference counting, garbage collection, and an efficient memory allocator to simplify development while maintaining good performance. Understanding these concepts helps developers write more efficient, reliable, and scalable Python applications.
""",
    ),
  ],
  quizQuestions: memoryManagementQuiz,
);