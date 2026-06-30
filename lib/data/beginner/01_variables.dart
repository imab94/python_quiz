import 'package:python_quiz/data/quizzes/beginner/variables_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const variablesTopic = Topic(
  title: "Variables",
  level: "Beginner",
  sections: [
    TopicSection(
      title: "What is a Variable?",
      content: """
A variable is a named container used to store data in memory. Instead of using a value directly every time, programmers store it inside a variable and reuse it throughout the program.

Think of a variable as a labeled box. The label is the variable name, and the box holds a value. That value can be a number, text, a list of items, or any other Python object.

Python is a dynamically typed language, so you do not need to specify the data type when creating a variable. Python automatically determines the data type based on the value assigned.

Variables make programs easier to read, maintain, and update. If a value changes, you only need to change it in one place instead of updating it everywhere in the program.
""",
    ),

    TopicSection(
      title: "Variable Naming Rules",
      content: """
Python has a few simple rules for naming variables.

Rules:

• Must begin with a letter or underscore (_)
• Cannot begin with a number
• Can contain letters, numbers, and underscores
• Cannot contain spaces
• Cannot use Python keywords such as if, for, while, class, or def
• Variable names are case-sensitive.

Example:

age and Age are two different variables.
""",
    ),

    TopicSection(
      title: "Creating Variables",
      content: """
Variables are created by assigning a value using the assignment operator (=).

Python automatically determines the variable's data type based on the assigned value.

A variable can store numbers, strings, booleans, lists, tuples, sets, dictionaries, and many other Python objects.
""",
      syntax: """
variable_name = value

age = 25
name = "Arun"
price = 99.99
is_student = True
""",
      exampleCode: """
student_name = "Arun"
age = 24
height = 5.8
is_student = True

print(student_name)
print(age)
print(height)
print(is_student)
""",
      output: """
Arun
24
5.8
True
""",
    ),

    TopicSection(
      title: "Multiple Variable Assignment",
      content: """
Python allows multiple variables to be assigned in a single statement. You can also assign the same value to multiple variables or swap values without using a temporary variable.
""",
      syntax: """
first_name, last_name = "Arun", "Bhardwaj"

x = y = z = 100

a, b = 10, 20
a, b = b, a
""",
      exampleCode: """
city, country = "Delhi", "India"

print(city)
print(country)

x = 10
y = 20

x, y = y, x

print(x)
print(y)
""",
      output: """
Delhi
India
20
10
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Writing meaningful variable names makes programs easier to understand and maintain.

Best Practices:

• Use descriptive names.
• Follow snake_case naming.
• Use lowercase variable names.
• Avoid single-letter names unless they are used in small loops.
• Choose names that clearly describe the stored data.

Good Examples:

• student_name
• total_price
• is_logged_in

Poor Examples:

• a
• x
• abc
• temp1

Always prefer readable names because your code will be easier for both you and other developers to understand.
""",
    ),
  ],
  quizQuestions: variablesQuiz
);