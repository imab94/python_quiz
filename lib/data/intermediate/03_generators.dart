import 'package:python_quiz/data/quizzes/intermediate/generators_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const generatorsTopic = Topic(
  title: "Generators",
  level: "Intermediate",
  priority: 10,
  isRecommended: true,
  recommendationReason: "Write memory-efficient Python programs.",
  sections: [
    TopicSection(
      title: "What are Generators?",
      content: """
A generator is a special type of function that produces values one at a time instead of returning all values at once.

Unlike a normal function, a generator remembers its current state after producing a value. The next time it is called, execution continues from where it previously stopped.

Generators are created using the yield keyword instead of the return keyword.

Because values are generated only when needed, generators are memory-efficient and are especially useful when working with very large datasets or infinite sequences.

Generators are one of Python's most powerful features for writing clean and efficient code.
""",
    ),

    TopicSection(
      title: "Why Do We Need Generators?",
      content: """
Imagine a program that needs to process one million numbers.

One approach is to create a list containing all one million numbers.

This requires a large amount of memory because every value is stored at the same time.

A generator solves this problem by producing values one by one only when they are needed.

This significantly reduces memory usage and allows programs to process very large amounts of data efficiently.

Generators are commonly used while reading large files, processing database records, handling network streams, and generating infinite sequences.
""",
    ),

    TopicSection(
      title: "Normal Functions vs Generators",
      content: """
A normal function executes completely and returns a single value using the return statement.

Once a return statement executes, the function ends.

A generator function uses the yield keyword instead.

Whenever a yield statement executes, the generator pauses its execution and returns the current value.

The next time the generator is called, it resumes execution exactly where it stopped.

This ability to pause and resume execution makes generators unique.
""",
    ),

    TopicSection(
      title: "The yield Keyword",
      content: """
The yield keyword is used to create generator functions.

Unlike return, which permanently ends a function, yield temporarily pauses execution.

When the generator resumes, execution continues immediately after the previous yield statement.

A generator function may contain multiple yield statements, allowing it to produce many values over time.
""",
      syntax: """
def generator_name():
    yield value
""",
      exampleCode: """
def numbers():

    yield 1
    yield 2
    yield 3


generator = numbers()

print(next(generator))
print(next(generator))
print(next(generator))
""",
      output: """
1
2
3
""",
    ),

    TopicSection(
      title: "Creating Your First Generator",
      content: """
Any function containing the yield keyword automatically becomes a generator function.

Calling the function does not execute it immediately.

Instead, Python returns a generator object.

Values are produced only when requested using next() or a loop.
""",
      exampleCode: """
def fruits():

    yield "Apple"
    yield "Banana"
    yield "Mango"


generator = fruits()

print(generator)
""",
      output: """
<generator object fruits at ...>
""",
    ),

    TopicSection(
      title: "Generator Objects",
      content: """
Calling a generator function creates a generator object.

This object remembers:

• The current execution position.
• Local variables.
• Remaining yield statements.

Unlike lists, generator objects do not store all values in memory.

Instead, they generate values only when requested.

This lazy evaluation makes generators extremely memory efficient.
""",
    ),

    TopicSection(
      title: "Using next() with Generators",
      content: """
The built-in next() function requests the next value from a generator.

Each call to next() resumes execution until the next yield statement is reached.

When all values have been generated, Python raises the StopIteration exception.
""",
      syntax: """
next(generator)
""",
      exampleCode: """
def colors():

    yield "Red"
    yield "Green"
    yield "Blue"


generator = colors()

print(next(generator))
print(next(generator))
print(next(generator))
""",
      output: """
Red
Green
Blue
""",
    ),
    TopicSection(
      title: "StopIteration Exception",
      content: """
A generator can produce only a limited number of values unless it is designed to generate values indefinitely.

When all yield statements have been executed, Python automatically raises the StopIteration exception.

Normally, you do not need to handle this exception manually because for loops automatically stop when the generator is exhausted.

However, when using next(), calling it after all values have been generated results in a StopIteration exception.
""",
      exampleCode: """
def numbers():

    yield 1
    yield 2


generator = numbers()

print(next(generator))
print(next(generator))

print(next(generator))
""",
      output: """
1
2
Traceback (most recent call last):
...
StopIteration
""",
    ),

    TopicSection(
      title: "Iterables vs Iterators vs Generators",
      content: """
These three concepts are closely related but have different purposes.

Iterable

An iterable is any object that can be looped over.

Examples:

• List
• Tuple
• String
• Dictionary
• Set

----------------------------------------

Iterator

An iterator keeps track of the current position while iterating through an iterable.

It provides the __iter__() and __next__() methods.

----------------------------------------

Generator

A generator is a special type of iterator created using the yield keyword.

Unlike normal iterators, generators automatically manage their internal state and produce values only when required.

Generators are simpler to write and consume much less memory than manually implementing iterators.
""",
    ),

    TopicSection(
      title: "Looping Through a Generator",
      content: """
Generators work naturally with Python's for loop.

The loop automatically calls next() repeatedly until the generator raises StopIteration.

Using a for loop is the recommended way to consume generator values because it is simple, clean, and automatically handles iteration.
""",
      exampleCode: """
def fruits():

    yield "Apple"
    yield "Banana"
    yield "Mango"


for fruit in fruits():
    print(fruit)
""",
      output: """
Apple
Banana
Mango
""",
    ),

    TopicSection(
      title: "Generator Expressions",
      content: """
Generator expressions provide a shorter way to create generators.

They are similar to list comprehensions but use parentheses instead of square brackets.

List Comprehension

Creates every value immediately.

----------------------------------------

Generator Expression

Produces values one at a time only when needed.

Generator expressions are ideal when working with large collections because they require significantly less memory.
""",
      syntax: """
generator = (
    expression
    for item in iterable
)
""",
      exampleCode: """
numbers = (
    number * number
    for number in range(1, 6)
)

for value in numbers:
    print(value)
""",
      output: """
1
4
9
16
25
""",
    ),

    TopicSection(
      title: "Infinite Generators",
      content: """
One of the greatest advantages of generators is that they can produce an unlimited sequence of values.

Instead of storing every value in memory, an infinite generator creates the next value only when requested.

Infinite generators are commonly used for:

• Continuous data streams
• Sensor readings
• Random number generation
• Event processing
• Server applications

When working with infinite generators, make sure there is a condition that eventually stops iteration. Otherwise, the program may run forever.
""",
      exampleCode: """
def count():

    number = 1

    while True:
        yield number
        number += 1


generator = count()

for _ in range(5):
    print(next(generator))
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
      title: "Memory Efficiency",
      content: """
One of the biggest advantages of generators is their excellent memory efficiency.

Lists store every value in memory at the same time.

Generators create only one value at a time and discard it after it has been processed.

This technique is called lazy evaluation.

Because generators do not store all values simultaneously, they are ideal for processing:

• Large files
• Millions of database records
• Network data
• Streaming applications
• Machine learning datasets

Using generators often results in lower memory usage and better overall performance.
""",
    ),

    TopicSection(
      title: "List vs Generator",
      content: """
Lists and generators may appear similar, but they work differently.

List

• Stores every value immediately.
• Uses more memory.
• Supports indexing.
• Can be reused multiple times.

----------------------------------------

Generator

• Produces one value at a time.
• Uses much less memory.
• Does not support indexing.
• Can usually be iterated only once.

Choose a list when you need random access to data.

Choose a generator when processing large amounts of data sequentially.
""",
    ),
    TopicSection(
      title: "Advantages of Generators",
      content: """
Generators provide several advantages over traditional functions and lists.

• Use very little memory.
• Generate values only when needed.
• Improve performance for large datasets.
• Simplify iterator creation.
• Support lazy evaluation.
• Can generate infinite sequences.
• Reduce unnecessary computations.
• Work naturally with for loops.

Generators are especially useful in applications that process large amounts of data efficiently.
""",
    ),

    TopicSection(
      title: "Disadvantages of Generators",
      content: """
Although generators are powerful, they also have some limitations.

• Values are generated only once.
• They do not support indexing.
• Their length cannot be determined directly using len().
• Debugging can sometimes be more difficult.
• Once exhausted, a generator cannot be reused without creating a new generator object.

Lists are often a better choice when data needs to be accessed multiple times or randomly.
""",
    ),

    TopicSection(
      title: "Common Use Cases",
      content: """
Generators are widely used in professional Python applications.

Some common use cases include:

• Reading large files line by line.
• Processing millions of database records.
• Web scraping.
• Streaming data.
• Log processing.
• Machine learning datasets.
• Network communication.
• Event processing.
• Infinite sequences.
• Pipeline data processing.

Whenever data can be processed one item at a time, generators are usually a better choice than storing everything in memory.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while working with generators.

• Use generators when processing large datasets.
• Prefer for loops instead of repeatedly calling next().
• Use generator expressions for simple one-line generators.
• Avoid converting generators into lists unless necessary.
• Remember that generators are usually exhausted after one complete iteration.
• Use meaningful function names that describe what the generator produces.
• Keep generator functions simple and focused on one task.

Using generators appropriately leads to efficient and Pythonic code.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates a generator that produces square numbers one at a time.

Notice how each value is generated only when the loop requests it.
""",
      exampleCode: """
def square_numbers(limit):

    for number in range(1, limit + 1):
        yield number * number


for square in square_numbers(5):
    print(square)
""",
      output: """
1
4
9
16
25
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about one of Python's most efficient features—Generators.

You learned:

• What generators are.
• Why generators are useful.
• Normal functions vs generators.
• The yield keyword.
• Generator objects.
• The next() function.
• StopIteration.
• Iterables, iterators, and generators.
• Generator expressions.
• Infinite generators.
• Memory efficiency.
• Lists vs generators.
• Advantages and disadvantages.
• Common use cases.
• Best practices.

Generators allow Python programs to produce values one at a time instead of storing everything in memory. This makes them ideal for processing large datasets, streams of data, and sequences whose size may be unknown in advance.

Understanding generators is an important step toward writing efficient, scalable, and Pythonic programs.
""",
    ),
  ],
  quizQuestions: generatorsQuiz,
);