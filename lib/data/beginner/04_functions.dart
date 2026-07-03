import 'package:python_quiz/data/quizzes/beginner/function_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const functionsTopic = Topic(
  title: "Functions",
  level: "Beginner",
  priority: 6,
  isRecommended: true,
  recommendationReason: "Build reusable and organized Python code.",
  sections: [
    TopicSection(
      title: "Introduction to Functions",
      content: """
A function is a reusable block of code that performs a specific task. Instead of writing the same code multiple times, you can place it inside a function and call it whenever needed.

Functions make programs shorter, more organized, easier to read, and easier to maintain. They are one of the most important building blocks of Python because almost every real-world application is made up of many small functions working together.
""",
    ),

    TopicSection(
      title: "Types of Functions",
      content: """
Python provides two types of functions.

Built-in Functions

These are functions that come with Python and are ready to use.

Examples:

• print()
• input()
• len()
• type()
• max()
• min()
• sum()
• abs()
• round()
• sorted()

User-defined Functions

These are functions created by programmers using the def keyword to perform specific tasks.
""",
    ),

    TopicSection(
      title: "Creating and Calling Functions",
      content: """
A function is created using the def keyword followed by the function name and parentheses.

After defining a function, it can be called by writing its name followed by parentheses.
""",
      syntax: """
# Function without parameters
def function_name():
    statements

# Function call
function_name()
""",
      exampleCode: """
def welcome():
    print("Welcome to Python!")

welcome()
""",
      output: """
Welcome to Python!
""",
    ),

    TopicSection(
      title: "Parameters and Arguments",
      content: """
Functions can accept input values called parameters.

A parameter is a variable defined in the function declaration.

An argument is the actual value passed while calling the function.

Parameters make functions reusable because the same function can work with different input values.
""",
      syntax: """
def function_name(parameter1, parameter2):
    statements

function_name(argument1, argument2)
""",
      exampleCode: """
def greet(name):
    print(f"Hello, {name}!")

greet("Arun")
greet("Rahul")
""",
      output: """
Hello, Arun!
Hello, Rahul!
""",
    ),

    TopicSection(
      title: "Types of Arguments",
      content: """
Python supports several types of arguments.

Positional Arguments

Arguments are matched according to their position.

Keyword Arguments

Arguments are passed using parameter names, making code easier to read.

Default Arguments

A parameter can have a default value. If no value is provided, the default value is used.

Variable-Length Arguments (*args)

Used when the number of positional arguments is unknown.

Keyword Variable-Length Arguments (**kwargs)

Used when the number of keyword arguments is unknown.
""",
      syntax: """
# Positional arguments
function(value1, value2)

# Keyword arguments
function(name="Arun", age=24)

# Default arguments
def function(name="Guest"):
    pass

# *args
def function(*args):
    pass

# **kwargs
def function(**kwargs):
    pass
""",
    ),

    TopicSection(
      title: "Return Statement",
      content: """
The return statement sends a value back to the caller.

A function can:

• Return one value
• Return multiple values
• Return no value

If a function does not contain a return statement, Python automatically returns None.
""",
      syntax: """
def function_name():
    return value
""",
      exampleCode: """
def add(number1, number2):
    return number1 + number2

result = add(10, 20)

print(result)
""",
      output: """
30
""",
    ),

    TopicSection(
      title: "Variable Scope",
      content: """
Variables created inside a function are called local variables and can only be accessed inside that function.

Variables created outside all functions are called global variables and can be accessed throughout the program.

Although global variables are useful in some situations, using local variables is generally considered a better programming practice because they make functions independent and easier to maintain.
""",
    ),

    TopicSection(
      title: "Benefits of Functions",
      content: """
Functions provide many advantages.

• Reduce code duplication
• Improve readability
• Make programs modular
• Simplify debugging
• Promote code reuse
• Make testing easier
• Improve maintainability
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when writing functions.

• Give functions meaningful names.
• Keep each function focused on one task.
• Use parameters instead of global variables whenever possible.
• Return values instead of printing whenever appropriate.
• Write small and reusable functions.
• Follow the snake_case naming convention.

Well-designed functions make code easier to understand, test, and maintain.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates creating functions, passing parameters, returning values, and using default arguments.
""",
      exampleCode: """
def welcome():
    print("Welcome to Python!")


def greet(name):
    print(f"Hello, {name}!")


def add(number1, number2):
    return number1 + number2


def introduce(name, country="India"):
    print(f"{name} is from {country}")


welcome()

greet("Arun")

result = add(10, 20)
print("Sum:", result)

introduce("Rahul")
introduce("John", "USA")
""",
      output: """
Welcome to Python!
Hello, Arun!
Sum: 30
Rahul is from India
John is from USA
""",
    ),
  ],
  quizQuestions: functionsQuiz,
);