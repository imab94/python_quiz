import 'package:python_quiz/data/quizzes/beginner/data_types_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const dataTypesTopic = Topic(
  title: "Data Types",
  level: "Beginner",
  priority: 4,
  isRecommended: true,
  recommendationReason: "Master Python's most fundamental data structures.",
  sections: [
    TopicSection(
      title: "Introduction to Data Types",
      content: """
Every value stored in a Python variable has a data type. A data type tells Python what kind of value a variable contains and what operations can be performed on it.

For example, numbers can be added, strings can be concatenated, and lists can store multiple values.

Python is a dynamically typed language, so you do not need to declare the data type explicitly. Python automatically determines the type based on the assigned value.

Choosing the correct data type helps make programs more efficient, readable, and easier to maintain.
""",
    ),

    TopicSection(
      title: "Numeric Data Types",
      content: """
Python provides three built-in numeric data types.

Integer (int)

Stores whole numbers without a decimal point.

Examples:

10
-25
0
5000

Common Uses:

• Counting
• Age
• IDs
• Mathematical calculations

----------------------------------------

Float (float)

Stores numbers with a decimal point.

Examples:

3.14
99.95
-12.5

Common Uses:

• Prices
• Measurements
• Percentages
• Scientific calculations

----------------------------------------

Complex (complex)

Stores numbers with a real part and an imaginary part.

Example:

3 + 5j

Complex numbers are mainly used in scientific computing, engineering, and advanced mathematics.
""",
      syntax: """
age = 25

price = 99.99

complex_number = 3 + 5j
""",
      exampleCode: """
age = 24
price = 99.99
complex_number = 3 + 2j

print(type(age))
print(type(price))
print(type(complex_number))
""",
      output: """
<class 'int'>
<class 'float'>
<class 'complex'>
""",
    ),

    TopicSection(
      title: "String Data Type",
      content: """
A string (str) is a sequence of characters enclosed in single quotes (' '), double quotes (" "), or triple quotes.

Examples:

"Python"

'Hello'

"123"

Strings are used to store textual information such as names, addresses, emails, messages, passwords, and descriptions.

Strings are immutable, which means their contents cannot be changed after they are created.
""",
      syntax: """
name = "Arun"

message = 'Hello'

paragraph = \"\"\"Python is easy to learn.\"\"\"
""",
      exampleCode: """
name = "Arun"

print(name)
print(type(name))
""",
      output: """
Arun
<class 'str'>
""",
    ),

    TopicSection(
      title: "Boolean Data Type",
      content: """
A boolean (bool) represents one of two values.

• True
• False

Booleans are mainly used in decision-making and conditional statements.

Examples:

is_logged_in = True

is_admin = False
""",
      syntax: """
is_student = True

is_logged_in = False
""",
      exampleCode: """
is_student = True

print(is_student)
print(type(is_student))
""",
      output: """
True
<class 'bool'>
""",
    ),

    TopicSection(
      title: "Collection Data Types",
      content: """
Python provides several collection data types for storing multiple values.

List (list)

• Ordered
• Mutable
• Allows duplicate values

Example:

["Apple", "Banana", "Mango"]

----------------------------------------

Tuple (tuple)

• Ordered
• Immutable
• Allows duplicate values

Example:

(10, 20, 30)

----------------------------------------

Set (set)

• Unordered
• Mutable
• Does not allow duplicate values

Example:

{1, 2, 3}

----------------------------------------

Dictionary (dict)

Stores data as key-value pairs.

Example:

{
    "name": "Arun",
    "age": 24
}

Each key must be unique.

Dictionaries are commonly used for user profiles, JSON data, configuration files, and API responses.
""",
      syntax: """
fruits = ["Apple", "Banana"]

coordinates = (10, 20)

numbers = {1, 2, 3}

student = {
    "name": "Arun",
    "age": 24
}
""",
      exampleCode: """
fruits = ["Apple", "Banana", "Mango"]
coordinates = (10, 20)
numbers = {1, 2, 3}
student = {
    "name": "Arun",
    "age": 24,
}

print(type(fruits))
print(type(coordinates))
print(type(numbers))
print(type(student))
""",
      output: """
<class 'list'>
<class 'tuple'>
<class 'set'>
<class 'dict'>
""",
    ),

    TopicSection(
      title: "None Data Type",
      content: """
The NoneType represents the absence of a value.

It is commonly used when a variable has no value yet or when a function does not return anything.

Example:

value = None

None is different from zero, an empty string, or False.
""",
      syntax: """
value = None
""",
      exampleCode: """
value = None

print(value)
print(type(value))
""",
      output: """
None
<class 'NoneType'>
""",
    ),

    TopicSection(
      title: "Mutable vs Immutable Data Types",
      content: """
Mutable data types can be modified after they are created.

Mutable:

• List
• Dictionary
• Set

----------------------------------------

Immutable data types cannot be modified after creation.

Immutable:

• Integer
• Float
• Complex
• String
• Boolean
• Tuple
• NoneType

Understanding whether a data type is mutable or immutable is important because it affects how data is stored and modified in memory.
""",
    ),

    TopicSection(
      title: "Checking Data Types",
      content: """
Python provides the built-in type() function to determine the data type of any value or variable.
""",
      syntax: """
type(variable_name)
""",
      exampleCode: """
name = "Arun"
age = 24

print(type(name))
print(type(age))
""",
      output: """
<class 'str'>
<class 'int'>
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
• Choose the correct data type for the problem.
• Use meaningful variable names.
• Prefer immutable data types when values should not change.
• Use lists for ordered collections that change.
• Use tuples for fixed data.
• Use sets when uniqueness is required.
• Use dictionaries for key-value relationships.
• Use the type() function while learning to understand the type of a value.

Understanding Python data types is essential because every Python program stores and manipulates data using these built-in types.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example creates variables using different Python data types and displays their types.
""",
      exampleCode: """
age = 24
price = 99.99
complex_number = 3 + 2j
name = "Arun"
is_student = True
fruits = ["Apple", "Banana", "Mango"]
coordinates = (10, 20)
numbers = {1, 2, 3}
student = {
    "name": "Arun",
    "age": 24,
}
value = None

print(type(age))
print(type(price))
print(type(complex_number))
print(type(name))
print(type(is_student))
print(type(fruits))
print(type(coordinates))
print(type(numbers))
print(type(student))
print(type(value))
""",
      output: """
<class 'int'>
<class 'float'>
<class 'complex'>
<class 'str'>
<class 'bool'>
<class 'list'>
<class 'tuple'>
<class 'set'>
<class 'dict'>
<class 'NoneType'>
""",
    ),
  ],
  quizQuestions: dataTypesQuiz,
);