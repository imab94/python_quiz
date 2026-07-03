import 'package:python_quiz/data/quizzes/intermediate/oop/variables_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const variablesInOOPTopic = Topic(
  title: "Instance and Class Variables",
  level: "Intermediate",
  priority: 15,
  isRecommended: true,
  recommendationReason: "Use shared and object-specific data effectively.",
  sections: [
    TopicSection(
      title: "Variables in Object-Oriented Programming",
      content: """
In Object-Oriented Programming (OOP), variables are used to store data related to a class or an object.

Python mainly provides two types of variables:

• Instance Variables
• Class Variables

Understanding the difference between these two is very important because it determines whether the data belongs to an individual object or to the entire class.

Choosing the correct type of variable makes programs more organized, memory-efficient, and easier to maintain.
""",
    ),

    TopicSection(
      title: "Instance Variables",
      content: """
Instance variables belong to individual objects.

Every object created from a class gets its own separate copy of the instance variables.

This means changing an instance variable in one object does not affect any other object.

Instance variables are usually created inside the constructor (__init__) using the self keyword.

Each object stores its own values for these variables.
""",
      syntax: """
class Student:

    def __init__(self, name, age):
        self.name = name
        self.age = age
""",
      exampleCode: """
class Student:

    def __init__(self, name, age):
        self.name = name
        self.age = age


student1 = Student("Arun", 24)
student2 = Student("Rahul", 21)

print(student1.name)
print(student2.name)
""",
      output: """
Arun
Rahul
""",
    ),

    TopicSection(
      title: "Characteristics of Instance Variables",
      content: """
Instance variables have the following characteristics.

• Belong to individual objects.
• Every object has its own copy.
• Created using the self keyword.
• Can have different values for different objects.
• Stored separately in each object's memory.
• Accessed using object names.

Example:

student1.name

student2.name

Even though both objects belong to the same class, they store different values.
""",
    ),

    TopicSection(
      title: "Accessing and Modifying Instance Variables",
      content: """
Instance variables are accessed using the dot (.) operator.

They can also be modified after an object has been created.

Updating an instance variable only affects that particular object.
""",
      syntax: """
object_name.variable_name

object_name.variable_name = value
""",
      exampleCode: """
class Student:

    def __init__(self, name):
        self.name = name


student = Student("Arun")

print(student.name)

student.name = "Rahul"

print(student.name)
""",
      output: """
Arun
Rahul
""",
    ),

    TopicSection(
      title: "Class Variables",
      content: """
Class variables belong to the class itself instead of individual objects.

Only one copy of a class variable exists, regardless of how many objects are created.

All objects share the same class variable.

Class variables are commonly used to store information that is common for every object.

Examples include:

• Company Name
• School Name
• Tax Percentage
• Country
• Currency
""",
      syntax: """
class Student:

    school_name = "ABC Public School"
""",
      exampleCode: """
class Student:

    school_name = "ABC Public School"


student1 = Student()
student2 = Student()

print(student1.school_name)
print(student2.school_name)
""",
      output: """
ABC Public School
ABC Public School
""",
    ),

    TopicSection(
      title: "Characteristics of Class Variables",
      content: """
Class variables have the following characteristics.

• Belong to the class.
• Shared by every object.
• Only one copy exists.
• Created directly inside the class.
• Accessed using either the class or an object.
• Mainly used for shared information.
""",
    ),

    TopicSection(
      title: "Accessing and Modifying Class Variables",
      content: """
Class variables can be accessed using either the class name or an object.

However, modifying them should always be done using the class name.

Using the class name makes it clear that the variable belongs to the class and updates the value for every object.
""",
      syntax: """
ClassName.variable_name

object_name.variable_name
""",
      exampleCode: """
class Student:

    school_name = "ABC Public School"


Student.school_name = "XYZ Public School"

student = Student()

print(student.school_name)
""",
      output: """
XYZ Public School
""",
    ),

    TopicSection(
      title: "Instance Variables vs Class Variables",
      content: """
Instance Variables

• Belong to an object.
• Every object has its own copy.
• Created using self.
• Store object-specific information.
• Different objects can have different values.

----------------------------------------

Class Variables

• Belong to the class.
• Shared by all objects.
• Declared directly inside the class.
• Store common information.
• Every object sees the same value.
""",
    ),

    TopicSection(
      title: "When Should You Use Each?",
      content: """
Use Instance Variables when:

• Every object has different information.

Examples:

• Student Name
• Employee Salary
• Age
• Address
• Balance

----------------------------------------

Use Class Variables when:

• Every object shares the same information.

Examples:

• School Name
• Company Name
• Country
• Currency
• Tax Percentage

Choosing the correct variable type improves code organization and memory usage.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while working with variables in OOP.

• Initialize instance variables inside the constructor.
• Use meaningful variable names.
• Store object-specific data in instance variables.
• Store shared data in class variables.
• Modify class variables using the class name.
• Avoid unnecessary class variables.
• Follow Python naming conventions.

Proper use of instance and class variables makes your classes easier to understand and maintain.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates both instance variables and class variables.
""",
      exampleCode: """
class Student:

    school_name = "ABC Public School"

    def __init__(self, name, age):
        self.name = name
        self.age = age


student1 = Student("Arun", 24)
student2 = Student("Rahul", 21)

print(student1.name)
print(student2.name)

print(student1.school_name)
print(student2.school_name)
""",
      output: """
Arun
Rahul
ABC Public School
ABC Public School
""",
    ),
  ],
  quizQuestions: variablesInOOPQuiz,
);