import 'package:python_quiz/data/quizzes/beginner/file_handling_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const fileHandlingTopic = Topic(
  title: "File Handling",
  level: "Beginner",
  sections: [
    TopicSection(
      title: "Introduction to File Handling",
      content: """
File handling is the process of creating, reading, writing, updating, and deleting files using Python.

Variables store data temporarily in memory, but their values are lost when the program ends. Files allow data to be stored permanently so it can be accessed later.

Python provides the built-in open() function to work with files. Before performing any operation on a file, it must first be opened.

After the operation is complete, the file should be closed to release system resources.

The recommended way to work with files is by using the with statement because it automatically closes the file, even if an error occurs.
""",
    ),

    TopicSection(
      title: "Opening Files",
      content: """
Python uses the open() function to open files.

The open() function accepts two arguments:

• File name or file path
• File mode

If the mode is not specified, Python opens the file in read mode by default.
""",
      syntax: """
file = open("file.txt", "mode")
""",
    ),

    TopicSection(
      title: "File Modes",
      content: """
Python supports several file modes.

Read Mode (r)

• Opens an existing file for reading.
• Raises an error if the file does not exist.

Write Mode (w)

• Creates a new file if it does not exist.
• Overwrites the existing file.

Append Mode (a)

• Adds data to the end of a file.
• Creates the file if it does not exist.

Exclusive Create Mode (x)

• Creates a new file.
• Raises an error if the file already exists.

Read & Write Modes

• r+
• w+
• a+

These modes allow both reading and writing.
""",
      syntax: """
open("file.txt", "r")
open("file.txt", "w")
open("file.txt", "a")
open("file.txt", "x")
open("file.txt", "r+")
open("file.txt", "w+")
open("file.txt", "a+")
""",
    ),

    TopicSection(
      title: "Reading Files",
      content: """
Python provides several methods to read file contents.

read()

Reads the entire file.

readline()

Reads one line at a time.

readlines()

Reads all lines and returns them as a list.
""",
      syntax: """
file.read()

file.readline()

file.readlines()
""",
      exampleCode: """
with open("student.txt", "r") as file:
    content = file.read()

print(content)
""",
      output: """
Name: Arun
Course: Python
""",
    ),

    TopicSection(
      title: "Writing Files",
      content: """
Python provides methods for writing data into files.

write()

Writes a single string.

writelines()

Writes multiple lines from a list.

If the file is opened using write mode, existing content will be overwritten.

Append mode adds new content without deleting existing data.
""",
      syntax: """
file.write("Hello")

file.writelines(lines)
""",
      exampleCode: """
with open("student.txt", "w") as file:
    file.write("Name: Arun\\n")
    file.write("Course: Python")
""",
    ),

    TopicSection(
      title: "Using the with Statement",
      content: """
The with statement is the recommended way to work with files.

It automatically closes the file after the operation is completed, even if an exception occurs.

This makes the code cleaner and safer.
""",
      syntax: """
with open("file.txt", "r") as file:
    statements
""",
      exampleCode: """
with open("student.txt", "r") as file:
    print(file.read())
""",
      output: """
Name: Arun
Course: Python
""",
    ),

    TopicSection(
      title: "File Paths",
      content: """
A file can be opened using either a relative path or an absolute path.

Relative Path

The path is relative to the current project.

Example:

data.txt

Absolute Path

The complete location of the file.

Example:

C:/Users/Arun/Documents/data.txt
""",
    ),

    TopicSection(
      title: "Common File Methods",
      content: """
Python provides many useful methods for working with files.

• close()
• read()
• readline()
• readlines()
• write()
• writelines()
• seek()
• tell()
• flush()

These methods help read, write, navigate, and manage file contents efficiently.
""",
    ),

    TopicSection(
      title: "Checking File Existence",
      content: """
Before opening a file, it is often useful to check whether it exists.

The os module provides functions to check file existence and avoid runtime errors.
""",
      exampleCode: """
import os

if os.path.exists("student.txt"):
    print("File exists.")
else:
    print("File not found.")
""",
      output: """
File exists.
""",
    ),

    TopicSection(
      title: "Applications of File Handling",
      content: """
File handling is used in almost every real-world application.

Common use cases include:

• Saving application data
• Reading configuration files
• Creating log files
• Processing text files
• Processing CSV files
• Storing user information
• Reading large datasets
• Generating reports
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when working with files.

• Always use the with statement.
• Close files properly if not using with.
• Choose the correct file mode.
• Handle exceptions while reading or writing files.
• Use meaningful file names.
• Avoid overwriting important files accidentally.

File handling is one of the most important Python skills because nearly every real-world application reads from or writes to files.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example writes data to a file and then reads it back.
""",
      exampleCode: """
with open("student.txt", "w") as file:
    file.write("Name: Arun\\n")
    file.write("Course: Python")

with open("student.txt", "r") as file:
    content = file.read()

print(content)
""",
      output: """
Name: Arun
Course: Python
""",
    ),
  ],
  quizQuestions: fileHandlingQuiz,
);