import 'package:python_quiz/data/quizzes/introduction/installation_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const iteratorsTopic = Topic(
  title: "Iterators",
  level: "Advanced",
  sections: [
    TopicSection(
      title: "What are Iterators?",
      content: """
An iterator is an object that allows you to access the elements of a collection one at a time.

Instead of returning every element at once, an iterator remembers its current position and returns the next element whenever requested.

Many Python objects such as lists, tuples, strings, dictionaries, and sets can be converted into iterators.

Iterators are one of the core features of Python because they allow efficient traversal of data without loading everything into memory at the same time.

The for loop, generators, and many built-in functions internally rely on iterators.
""",
    ),

    TopicSection(
      title: "Why Do We Need Iterators?",
      content: """
Imagine a list containing one million numbers.

If Python had to process all values simultaneously, it would require a large amount of memory.

Instead, an iterator processes one value at a time.

This makes programs more memory-efficient and allows Python to work efficiently with large datasets, files, database records, and streams of data.

Iterators are the foundation of Python's iteration system.
""",
    ),

    TopicSection(
      title: "What is an Iterable?",
      content: """
An iterable is any object that can be traversed one element at a time.

Examples of iterables include:

• List
• Tuple
• String
• Dictionary
• Set
• Range

An iterable is not an iterator itself.

Instead, it is an object that can produce an iterator using the iter() function.

Every iterator is iterable, but not every iterable is an iterator.
""",
      exampleCode: """
numbers = [10, 20, 30]

print(type(numbers))
""",
      output: """
<class 'list'>
""",
    ),

    TopicSection(
      title: "Creating an Iterator",
      content: """
The built-in iter() function converts an iterable into an iterator.

Once an iterator is created, it remembers its current position while traversing the collection.

The iterator does not return values automatically.

Values are retrieved using the next() function.
""",
      syntax: """
iterator = iter(iterable)
""",
      exampleCode: """
numbers = [10, 20, 30]

iterator = iter(numbers)

print(iterator)
""",
      output: """
<list_iterator object at ...>
""",
    ),

    TopicSection(
      title: "The next() Function",
      content: """
The next() function retrieves the next value from an iterator.

Every call to next() moves the iterator forward by one position.

When there are no more values available, Python raises the StopIteration exception.

The next() function gives programmers complete control over iteration.
""",
      syntax: """
next(iterator)
""",
      exampleCode: """
numbers = [10, 20, 30]

iterator = iter(numbers)

print(next(iterator))
print(next(iterator))
print(next(iterator))
""",
      output: """
10
20
30
""",
    ),

    TopicSection(
      title: "Iterator Protocol",
      content: """
Every iterator in Python follows a standard set of rules called the Iterator Protocol.

An iterator must implement two special methods:

• __iter__()
• __next__()

The __iter__() method returns the iterator object itself.

The __next__() method returns the next value in the sequence.

When all values have been returned, __next__() raises the StopIteration exception.

Because every iterator follows the same protocol, Python's for loop can work with any iterator.
""",
    ),

    TopicSection(
      title: "How a for Loop Uses Iterators",
      content: """
Although a for loop appears simple, it internally uses iterators.

When a for loop begins, Python automatically:

1. Calls iter() on the iterable.
2. Repeatedly calls next().
3. Stops when StopIteration is raised.

This process happens automatically, allowing programmers to write simple loops while Python handles the iteration internally.
""",
      exampleCode: """
numbers = [10, 20, 30]

for number in numbers:
    print(number)
""",
      output: """
10
20
30
""",
    ),
    TopicSection(
      title: "StopIteration Exception",
      content: """
Every iterator has a limited number of values unless it is designed to produce values indefinitely.

When there are no more values to return, Python automatically raises the StopIteration exception.

This exception tells Python that the iteration has finished.

Normally, programmers do not need to handle this exception manually because for loops automatically catch it and stop iterating.

However, when using the next() function directly, calling next() after all values have been consumed raises StopIteration.
""",
      exampleCode: """
numbers = [10, 20]

iterator = iter(numbers)

print(next(iterator))
print(next(iterator))

print(next(iterator))
""",
      output: """
10
20
Traceback (most recent call last):
...
StopIteration
""",
    ),

    TopicSection(
      title: "Creating a Custom Iterator",
      content: """
Python allows programmers to create their own iterator classes.

A custom iterator must implement two special methods.

• __iter__()
• __next__()

The __iter__() method returns the iterator object.

The __next__() method returns the next value in the sequence.

When all values have been produced, __next__() must raise the StopIteration exception.

This allows custom objects to work naturally with for loops and other Python iteration tools.
""",
    ),

    TopicSection(
      title: "Implementing __iter__()",
      content: """
The __iter__() method is responsible for returning the iterator object.

In many custom iterators, it simply returns self because the object itself acts as the iterator.

Python automatically calls this method whenever iteration begins.
""",
      syntax: """
def __iter__(self):
    return self
""",
    ),

    TopicSection(
      title: "Implementing __next__()",
      content: """
The __next__() method returns the next value from the iterator.

Every call should produce one value.

When no values remain, the method must raise the StopIteration exception.

Python automatically calls __next__() during iteration.
""",
      syntax: """
def __next__(self):
    return value
""",
      exampleCode: """
class Counter:

    def __init__(self):
        self.number = 1

    def __iter__(self):
        return self

    def __next__(self):
        if self.number <= 3:
            value = self.number
            self.number += 1
            return value

        raise StopIteration


counter = Counter()

for value in counter:
    print(value)
""",
      output: """
1
2
3
""",
    ),

    TopicSection(
      title: "Iterables vs Iterators",
      content: """
Although these terms are often used together, they are not the same.

Iterable

• Can produce an iterator.
• Supports the iter() function.
• Examples include lists, tuples, strings, sets, dictionaries, and ranges.

----------------------------------------

Iterator

• Produced from an iterable.
• Keeps track of the current position.
• Supports both __iter__() and __next__().
• Produces one value at a time.

Every iterator is iterable, but not every iterable is an iterator.
""",
    ),

    TopicSection(
      title: "Iterators vs Generators",
      content: """
Generators are a special type of iterator.

Both generators and iterators produce one value at a time.

However, they are created differently.

Iterator

• Usually implemented as a class.
• Requires __iter__() and __next__().
• More code to write.

----------------------------------------

Generator

• Created using a function.
• Uses the yield keyword.
• Automatically implements the iterator protocol.
• Easier to write and maintain.

For most applications, generators are preferred because they require much less code while providing the same lazy evaluation behavior.
""",
    ),

    TopicSection(
      title: "Memory Efficiency",
      content: """
Iterators improve memory efficiency because they produce values one at a time instead of storing every value in memory.

This approach is known as lazy evaluation.

Instead of creating an entire collection before processing it, an iterator generates each value only when it is requested.

This makes iterators especially useful for:

• Large files.
• Database records.
• Network streams.
• Data pipelines.
• Large datasets.

Using iterators often results in lower memory usage and better application performance.
""",
    ),

    TopicSection(
      title: "Real-World Applications",
      content: """
Iterators are used extensively in Python's standard library and professional software.

Common applications include:

• Reading files line by line.
• Processing database records.
• Streaming data.
• Network communication.
• Parsing large log files.
• Machine learning datasets.
• Data processing pipelines.
• Web scraping.

Many Python libraries internally use iterators to process data efficiently without consuming excessive memory.
""",
    ),
    TopicSection(
      title: "Advantages of Iterators",
      content: """
Iterators provide many advantages when processing data.

• Process one element at a time.
• Use less memory than storing all values at once.
• Support lazy evaluation.
• Work efficiently with large datasets.
• Integrate seamlessly with Python's for loop.
• Can process infinite sequences.
• Improve application performance when working with streams of data.
• Form the foundation of generators and many built-in Python features.

Because of these benefits, iterators are widely used in professional Python applications.
""",
    ),

    TopicSection(
      title: "Disadvantages of Iterators",
      content: """
Although iterators are very useful, they also have some limitations.

• Values are consumed as they are accessed.
• An exhausted iterator cannot be reused.
• They do not support random indexing.
• Determining the total number of remaining elements is not straightforward.
• Beginners may find the iterator protocol difficult at first.

If data needs to be accessed multiple times, converting it into a list may be a better choice.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while working with iterators.

• Use iterators when processing large collections.
• Prefer for loops instead of repeatedly calling next().
• Raise StopIteration correctly in custom iterators.
• Keep iterator classes focused on a single responsibility.
• Use meaningful class and variable names.
• Consider generators when a custom iterator becomes too complex.
• Avoid converting iterators into lists unless random access is required.

Using iterators correctly results in cleaner, more efficient, and more Pythonic code.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates a custom iterator that generates numbers from 1 to a specified limit.
""",
      exampleCode: """
class Counter:

    def __init__(self, limit):
        self.limit = limit
        self.current = 1

    def __iter__(self):
        return self

    def __next__(self):
        if self.current <= self.limit:
            value = self.current
            self.current += 1
            return value

        raise StopIteration


counter = Counter(5)

for number in counter:
    print(number)
""",
      output: """
1
2
3
4
5
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about Iterators, one of Python's core programming concepts.

You learned:

• What an iterator is.
• Why iterators are important.
• What an iterable is.
• The iter() function.
• The next() function.
• The iterator protocol.
• How for loops use iterators.
• StopIteration.
• Creating custom iterators.
• The __iter__() method.
• The __next__() method.
• Iterables vs iterators.
• Iterators vs generators.
• Memory efficiency.
• Real-world applications.
• Advantages and disadvantages.
• Best practices.

Iterators allow Python to process data one element at a time, making programs more memory-efficient and scalable. They are the foundation of generators, for loops, and many built-in Python features. Understanding iterators is essential for writing efficient and professional Python code.
""",
    ),
  ],
  quizQuestions: installationQuiz,
);