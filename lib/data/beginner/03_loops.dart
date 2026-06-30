import 'package:python_quiz/data/quizzes/beginner/loops_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const loopsTopic = Topic(
  title: "Loops",
  level: "Beginner",
  sections: [
    TopicSection(
      title: "Introduction to Loops",
      content: """
Loops are used to execute a block of code repeatedly without writing the same statements multiple times. They make programs shorter, easier to read, and easier to maintain.

Instead of writing the same code again and again, you can place it inside a loop and let Python execute it repeatedly.

Python provides two main types of loops:

• for loop
• while loop

Loops are commonly used for processing collections of data, generating patterns, reading files, and automating repetitive tasks.
""",
    ),

    TopicSection(
      title: "The for Loop",
      content: """
The for loop is used to iterate over a sequence such as a string, list, tuple, set, dictionary, or range of numbers.

It is the most commonly used loop in Python because the number of iterations is usually known before the loop starts.

Common Uses:

• Printing all items in a list
• Iterating through a string
• Reading files line by line
• Generating multiplication tables
• Processing collections
""",
      syntax: """
for variable in sequence:
    statements

for variable in range(start, stop, step):
    statements
""",
      exampleCode: """
for number in range(1, 6):
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
      title: "The while Loop",
      content: """
The while loop executes as long as a specified condition remains True.

Unlike the for loop, the number of iterations is usually unknown before execution begins.

Common Uses:

• Reading user input
• Game loops
• Menu-driven applications
• Waiting for a process to complete

Always update the loop condition. Otherwise, the loop may become an infinite loop.
""",
      syntax: """
while condition:
    statements
""",
      exampleCode: """
count = 1

while count <= 5:
    print(count)
    count += 1
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
      title: "The range() Function",
      content: """
The range() function generates a sequence of numbers and is commonly used with for loops.

Examples:

range(5)
Produces: 0, 1, 2, 3, 4

range(2, 6)
Produces: 2, 3, 4, 5

range(1, 10, 2)
Produces: 1, 3, 5, 7, 9
""",
      syntax: """
range(stop)

range(start, stop)

range(start, stop, step)
""",
      exampleCode: """
for number in range(2, 11, 2):
    print(number)
""",
      output: """
2
4
6
8
10
""",
    ),

    TopicSection(
      title: "Loop Control Statements",
      content: """
Python provides three loop control statements.

break
Immediately exits the nearest loop.

continue
Skips the current iteration and continues with the next iteration.

pass
Acts as a placeholder and does nothing. It is useful when writing incomplete code.
""",
      syntax: """
break

continue

pass
""",
      exampleCode: """
for number in range(1, 6):
    if number == 3:
        continue

    if number == 5:
        break

    print(number)
""",
      output: """
1
2
4
""",
    ),

    TopicSection(
      title: "Nested Loops",
      content: """
A loop inside another loop is called a nested loop.

Nested loops are commonly used for:

• Printing patterns
• Working with matrices
• Comparing collections
• Multiplication tables
""",
      syntax: """
for outer in sequence:
    for inner in sequence:
        statements
""",
      exampleCode: """
for row in range(1, 3):
    for column in range(1, 4):
        print(row, column)
""",
      output: """
1 1
1 2
1 3
2 1
2 2
2 3
""",
    ),

    TopicSection(
      title: "Looping Through Different Data Types",
      content: """
Python loops can iterate through many built-in data types.

You can loop through:

• Strings
• Lists
• Tuples
• Sets
• Dictionaries
• Range objects

For dictionaries, you can iterate through:

• Keys
• Values
• Key-value pairs using items()
""",
      exampleCode: """
student = {
    "name": "Arun",
    "age": 24,
}

for key, value in student.items():
    print(key, ":", value)
""",
      output: """
name : Arun
age : 24
""",
    ),

    TopicSection(
      title: "Infinite Loops",
      content: """
An infinite loop is a loop that never ends.

Example:

while True:
    print("Running...")

Infinite loops are useful in servers, games, and applications that should continue running until they are manually stopped.

Use them carefully because they can consume system resources indefinitely.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
• Use a for loop when the number of iterations is known.
• Use a while loop when repetition depends on a condition.
• Keep loop bodies small and readable.
• Avoid unnecessary nested loops.
• Always ensure while loops eventually terminate.
• Use meaningful variable names.
• Use break and continue only when they improve readability.

Loops are one of the most fundamental programming concepts because they allow programs to process large amounts of data efficiently with very little code.
""",
    ),
  ],
  quizQuestions: loopsQuiz,
);