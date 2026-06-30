import 'package:python_quiz/data/quizzes/intermediate/oop/encapsulation_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const encapsulationTopic = Topic(
  title: "Encapsulation",
  level: "Intermediate",
  sections: [
    TopicSection(
      title: "What is Encapsulation?",
      content: """
Encapsulation is one of the four fundamental principles of Object-Oriented Programming (OOP).

Encapsulation is the process of combining data (variables) and the methods that operate on that data into a single unit called a class.

It also helps protect an object's data by controlling how it can be accessed or modified from outside the class.

Instead of allowing direct access to important data, a class provides methods that safely read or update that data.

This improves security, reduces accidental modifications, and makes programs easier to maintain.

In simple words, encapsulation means "wrapping data and methods together inside a class while controlling access to the data."
""",
    ),

    TopicSection(
      title: "Why Do We Need Encapsulation?",
      content: """
Imagine a bank account.

Suppose the account balance is stored in a variable.

If everyone could directly modify that variable, someone could accidentally or intentionally change the balance to any value.

Instead, the balance should only be changed through methods like:

• deposit()
• withdraw()

These methods can validate the amount before updating the balance.

Encapsulation protects data by allowing controlled access instead of direct access.
""",
    ),

    TopicSection(
      title: "Benefits of Encapsulation",
      content: """
Encapsulation provides many advantages.

• Protects important data.
• Prevents accidental modifications.
• Improves code security.
• Makes code easier to maintain.
• Increases flexibility.
• Improves code readability.
• Supports data validation.
• Promotes modular programming.
• Reduces dependencies between different parts of a program.

Encapsulation is widely used in real-world applications such as banking systems, hospital management systems, and e-commerce applications.
""",
    ),

    TopicSection(
      title: "Public Members",
      content: """
Public members are variables and methods that can be accessed from anywhere.

In Python, every variable and method is public by default.

Example:

name

age

display()

Public members can be accessed directly using an object.
""",
      syntax: """
class Student:

    def __init__(self):
        self.name = "Arun"
""",
      exampleCode: """
class Student:

    def __init__(self):
        self.name = "Arun"


student = Student()

print(student.name)
""",
      output: """
Arun
""",
    ),

    TopicSection(
      title: "Protected Members",
      content: """
Protected members are intended to be accessed only within the class and its subclasses.

In Python, protected members are created by placing a single underscore (_) before the variable or method name.

Example:

_name

_age

Although Python does not strictly prevent access, a single underscore indicates that the member is intended for internal use.

This is a naming convention followed by Python developers.
""",
      syntax: """
self._name
""",
      exampleCode: """
class Student:

    def __init__(self):
        self._name = "Arun"


student = Student()

print(student._name)
""",
      output: """
Arun
""",
    ),

    TopicSection(
      title: "Private Members",
      content: """
Private members are intended to be accessed only within the class.

In Python, private members are created using two leading underscores (__).

Example:

__balance

__password

Python performs name mangling on private members, making them harder to access directly from outside the class.

This provides a higher level of protection compared to protected members.
""",
      syntax: """
self.__variable
""",
      exampleCode: """
class BankAccount:

    def __init__(self):
        self.__balance = 1000

    def show_balance(self):
        print(self.__balance)


account = BankAccount()

account.show_balance()
""",
      output: """
1000
""",
    ),

    TopicSection(
      title: "Name Mangling",
      content: """
Python does not completely hide private variables.

Instead, it changes their internal names using a mechanism called Name Mangling.

For example,

self.__balance

becomes something similar to

_ClassName__balance

This prevents accidental access but does not provide absolute security.

Python uses name mangling to encourage proper usage rather than enforce strict access restrictions.
""",
    ),

    TopicSection(
      title: "Getter and Setter Methods",
      content: """
Instead of accessing private variables directly, programmers usually create getter and setter methods.

Getter methods return the value of a private variable.

Setter methods update the value after performing validation.

This ensures that only valid data is stored inside an object.
""",
      syntax: """
def get_value(self):
    return self.__value

def set_value(self, value):
    self.__value = value
""",
      exampleCode: """
class BankAccount:

    def __init__(self):
        self.__balance = 1000

    def get_balance(self):
        return self.__balance

    def set_balance(self, amount):
        if amount >= 0:
            self.__balance = amount


account = BankAccount()

account.set_balance(2500)

print(account.get_balance())
""",
      output: """
2500
""",
    ),

    TopicSection(
      title: "Using the @property Decorator",
      content: """
Python provides the @property decorator to create getters and setters in a cleaner and more Pythonic way.

The @property decorator allows methods to be accessed like normal variables.

This improves code readability while still providing controlled access to private data.

It is widely used in professional Python applications.
""",
      syntax: """
@property

@variable.setter
""",
      exampleCode: """
class Student:

    def __init__(self):
        self.__age = 20

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, value):
        if value > 0:
            self.__age = value


student = Student()

student.age = 25

print(student.age)
""",
      output: """
25
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while implementing encapsulation.

• Keep important data private.
• Validate data before updating it.
• Use getter and setter methods when necessary.
• Prefer @property for cleaner code.
• Expose only the functionality that users need.
• Hide implementation details whenever possible.
• Keep data and related methods together inside the same class.

Good encapsulation produces secure, flexible, and maintainable software.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates encapsulation using private variables and methods.
""",
      exampleCode: """
class BankAccount:

    def __init__(self, owner, balance):
        self.owner = owner
        self.__balance = balance

    def deposit(self, amount):
        self.__balance += amount

    def withdraw(self, amount):
        if amount <= self.__balance:
            self.__balance -= amount

    def get_balance(self):
        return self.__balance


account = BankAccount("Arun", 1000)

account.deposit(500)

account.withdraw(300)

print(account.get_balance())
""",
      output: """
1200
""",
    ),
  ],
  quizQuestions: encapsulationQuiz,
);