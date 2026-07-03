import 'package:python_quiz/data/quizzes/intermediate/oop/dunder_methods_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const dunderMethodsTopic = Topic(
  title: "Dunder (Magic) Methods",
  level: "Intermediate",
  priority: 21,
  isRecommended: true,
  recommendationReason: "Customize object behavior with magic methods.",
  sections: [
    TopicSection(
      title: "What are Dunder Methods?",
      content: """
Dunder Methods, also known as Magic Methods or Special Methods, are predefined methods provided by Python that begin and end with two underscores.

Examples include:

__init__

__str__

__len__

__eq__

__add__

The word "Dunder" means "Double UNDERscore."

These methods allow Python objects to work naturally with built-in functions, operators, and language features.

For example:

• print(object)
• len(object)
• object1 + object2
• object1 == object2

Internally, Python calls these special methods automatically.

Instead of calling them yourself, Python executes them whenever the corresponding operation is performed.
""",
    ),

    TopicSection(
      title: "Why Do We Need Dunder Methods?",
      content: """
Without dunder methods, user-defined objects would behave like simple memory addresses.

For example, printing an object would produce output similar to:

<__main__.Student object at 0x...>

This output is not very useful.

Dunder methods allow us to define exactly how objects should behave.

They make custom classes behave like Python's built-in data types.

Using dunder methods improves readability, usability, and integration with Python's language features.
""",
    ),

    TopicSection(
      title: "Commonly Used Dunder Methods",
      content: """
Python provides many special methods.

Some of the most frequently used ones are:

• __init__()
• __str__()
• __repr__()
• __len__()
• __eq__()
• __add__()
• __getitem__()
• __setitem__()
• __contains__()
• __call__()
• __iter__()
• __next__()

Each method controls a different behavior of an object.

Together, these methods make Python objects powerful and flexible.
""",
    ),

    TopicSection(
      title: "The __init__() Method",
      content: """
The __init__() method is the constructor of a class.

It automatically executes whenever a new object is created.

Its primary purpose is to initialize instance variables.

Although __init__ is a dunder method, you have already used it while learning constructors.

Python automatically calls __init__ after allocating memory for the object.
""",
      syntax: """
class Student:

    def __init__(self):
        statements
""",
      exampleCode: """
class Student:

    def __init__(self, name):
        self.name = name


student = Student("Arun")

print(student.name)
""",
      output: """
Arun
""",
    ),

    TopicSection(
      title: "The __str__() Method",
      content: """
The __str__() method controls what is displayed when an object is printed using the print() function.

Without this method, Python prints the object's memory address.

Implementing __str__ makes objects more readable and user-friendly.

The method must always return a string.
""",
      syntax: """
def __str__(self):
    return "text"
""",
      exampleCode: """
class Student:

    def __init__(self, name):
        self.name = name

    def __str__(self):
        return f"Student: {self.name}"


student = Student("Arun")

print(student)
""",
      output: """
Student: Arun
""",
    ),

    TopicSection(
      title: "The __repr__() Method",
      content: """
The __repr__() method returns the official string representation of an object.

It is mainly intended for developers and debugging.

Whenever possible, __repr__ should return a string that could recreate the object.

If __str__ is not defined, Python often falls back to using __repr__.

While __str__ focuses on readability, __repr__ focuses on precision and debugging.
""",
      syntax: """
def __repr__(self):
    return "representation"
""",
      exampleCode: """
class Student:

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return f"Student('{self.name}')"


student = Student("Arun")

print(repr(student))
""",
      output: """
Student('Arun')
""",
    ),
    TopicSection(
      title: "The __len__() Method",
      content: """
The __len__() method defines what should happen when the built-in len() function is called on an object.

Normally, len() works with strings, lists, tuples, sets, and dictionaries.

By implementing __len__(), your own classes can also work with len().

The method must return a non-negative integer representing the length or size of the object.
""",
      syntax: """
def __len__(self):
    return length
""",
      exampleCode: """
class Student:

    def __init__(self, subjects):
        self.subjects = subjects

    def __len__(self):
        return len(self.subjects)


student = Student(["Python", "Java", "SQL"])

print(len(student))
""",
      output: """
3
""",
    ),

    TopicSection(
      title: "The __eq__() Method",
      content: """
The __eq__() method defines how two objects should be compared using the equality operator (==).

Without __eq__(), Python compares whether two variables refer to the same object in memory.

By implementing __eq__(), you can compare the actual contents of two objects instead.

This makes object comparisons more meaningful.
""",
      syntax: """
def __eq__(self, other):
    return condition
""",
      exampleCode: """
class Student:

    def __init__(self, roll_number):
        self.roll_number = roll_number

    def __eq__(self, other):
        return self.roll_number == other.roll_number


student1 = Student(101)
student2 = Student(101)

print(student1 == student2)
""",
      output: """
True
""",
    ),

    TopicSection(
      title: "The __add__() Method",
      content: """
The __add__() method defines how the + operator should behave for custom objects.

Python automatically calls this method whenever two objects are added using the + operator.

This feature is called operator overloading.

It allows programmers to define meaningful behavior for custom classes.
""",
      syntax: """
def __add__(self, other):
    return value
""",
      exampleCode: """
class Number:

    def __init__(self, value):
        self.value = value

    def __add__(self, other):
        return self.value + other.value


number1 = Number(10)
number2 = Number(20)

print(number1 + number2)
""",
      output: """
30
""",
    ),

    TopicSection(
      title: "The __getitem__() Method",
      content: """
The __getitem__() method allows objects to support indexing using square brackets ([]).

Whenever an index is accessed, Python automatically calls __getitem__().

This makes custom objects behave like lists, tuples, or dictionaries.

It is commonly used while creating custom collections.
""",
      syntax: """
def __getitem__(self, index):
    return value
""",
      exampleCode: """
class Numbers:

    def __init__(self):
        self.data = [10, 20, 30]

    def __getitem__(self, index):
        return self.data[index]


numbers = Numbers()

print(numbers[1])
""",
      output: """
20
""",
    ),

    TopicSection(
      title: "The __setitem__() Method",
      content: """
The __setitem__() method controls what happens when a value is assigned using square brackets.

Python automatically calls this method whenever an assignment such as object[index] = value is performed.

It allows custom objects to behave like mutable collections.
""",
      syntax: """
def __setitem__(self, index, value):
    statements
""",
      exampleCode: """
class Numbers:

    def __init__(self):
        self.data = [10, 20, 30]

    def __setitem__(self, index, value):
        self.data[index] = value


numbers = Numbers()

numbers[1] = 99

print(numbers.data)
""",
      output: """
[10, 99, 30]
""",
    ),

    TopicSection(
      title: "The __contains__() Method",
      content: """
The __contains__() method defines how the in operator behaves for custom objects.

Whenever Python evaluates:

value in object

it automatically calls the __contains__() method.

This method should return either True or False.

It is useful when building custom containers and collection classes.
""",
      syntax: """
def __contains__(self, value):
    return True
""",
      exampleCode: """
class Numbers:

    def __init__(self):
        self.data = [10, 20, 30]

    def __contains__(self, value):
        return value in self.data


numbers = Numbers()

print(20 in numbers)
print(50 in numbers)
""",
      output: """
True
False
""",
    ),
    TopicSection(
      title: "The __call__() Method",
      content: """
The __call__() method allows an object to be called like a function.

Normally, we call functions using parentheses.

Example:

greet()

If a class implements the __call__() method, its objects can also be called using parentheses.

Python automatically executes the __call__() method whenever an object is called.

This is useful for creating callable objects, function-like classes, and machine learning models where objects behave like functions.
""",
      syntax: """
def __call__(self):
    statements
""",
      exampleCode: """
class Greeting:

    def __call__(self):
        print("Welcome to Python!")


greet = Greeting()

greet()
""",
      output: """
Welcome to Python!
""",
    ),

    TopicSection(
      title: "The __iter__() Method",
      content: """
The __iter__() method makes an object iterable.

Whenever a for loop starts iterating over an object, Python first calls the __iter__() method.

This method must return an iterator object.

Many built-in data types such as lists, tuples, strings, sets, and dictionaries already implement __iter__().

Custom classes can also implement this method to support iteration.
""",
      syntax: """
def __iter__(self):
    return self
""",
      exampleCode: """
class Numbers:

    def __init__(self):
        self.data = [10, 20, 30]

    def __iter__(self):
        return iter(self.data)


numbers = Numbers()

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
      title: "The __next__() Method",
      content: """
The __next__() method returns the next value from an iterator.

Python automatically calls __next__() during iteration.

When there are no more values to return, the method must raise the StopIteration exception.

The __iter__() and __next__() methods work together to create custom iterators.

These methods form the foundation of Python's iterator protocol.
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
      title: "Object Lifecycle and Dunder Methods",
      content: """
When an object is created and used, Python automatically calls different dunder methods at different stages.

For example:

Object Creation

__init__()

----------------------------------------

Printing the Object

__str__()

----------------------------------------

Getting the Official Representation

__repr__()

----------------------------------------

Comparing Objects

__eq__()

----------------------------------------

Adding Objects

__add__()

----------------------------------------

Getting Length

__len__()

----------------------------------------

Iterating

__iter__()
__next__()

Understanding this lifecycle helps developers know exactly when Python executes each special method automatically.
""",
    ),

    TopicSection(
      title: "Advantages of Dunder Methods",
      content: """
Dunder methods provide many advantages.

• Make custom objects behave like built-in Python objects.
• Improve code readability.
• Support operator overloading.
• Enable object comparison.
• Support iteration.
• Improve integration with Python's built-in functions.
• Make classes more flexible.
• Reduce boilerplate code.

Many popular Python libraries such as Django, NumPy, Pandas, and TensorFlow make extensive use of dunder methods.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices while implementing dunder methods.

• Implement only the methods your class actually needs.
• Always return the correct data type.
• Keep implementations simple and predictable.
• Use __str__() for user-friendly output.
• Use __repr__() for debugging.
• Follow standard Python behavior whenever possible.
• Avoid changing the expected meaning of built-in operators.

Properly implemented dunder methods make custom classes feel like native Python objects.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example combines several commonly used dunder methods in a single class.
""",
      exampleCode: """
class Student:

    def __init__(self, name):
        self.name = name

    def __str__(self):
        return f"Student: {self.name}"

    def __len__(self):
        return len(self.name)

    def __call__(self):
        print("Object called successfully.")


student = Student("Arun")

print(student)
print(len(student))

student()
""",
      output: """
Student: Arun
4
Object called successfully.
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about Dunder (Magic) Methods, one of Python's most powerful features.

You learned:

• What dunder methods are.
• Why they are used.
• __init__()
• __str__()
• __repr__()
• __len__()
• __eq__()
• __add__()
• __getitem__()
• __setitem__()
• __contains__()
• __call__()
• __iter__()
• __next__()
• Object lifecycle.
• Advantages of dunder methods.
• Best practices.

Dunder methods allow custom classes to behave like Python's built-in objects. By implementing these methods, you can customize how your objects are created, displayed, compared, iterated, and used with operators and built-in functions.

Mastering dunder methods is an important step toward writing professional, Pythonic, and reusable Object-Oriented code.
""",
    ),
  ],
  quizQuestions: dunderMethodsQuiz,
);