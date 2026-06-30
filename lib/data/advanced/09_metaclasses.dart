import 'package:python_quiz/data/quizzes/advanced/metaclasses_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const metaclassesTopic = Topic(
  title: "Metaclasses",
  level: "Advanced",
  sections: [
    TopicSection(
      title: "What are Metaclasses?",
      content: """
A metaclass is a class whose purpose is to create and control other classes.

Just as classes create objects, metaclasses create classes.

This is why metaclasses are often described as "classes of classes."

Normally, when you define a class in Python, Python automatically creates that class using its default metaclass.

Most Python programmers never need to create a custom metaclass because the default behavior is sufficient for most applications.

However, metaclasses provide powerful customization for advanced frameworks and libraries.
""",
    ),

    TopicSection(
      title: "Why Do We Need Metaclasses?",
      content: """
Sometimes developers need to control how classes are created.

For example, they may want to:

• Automatically validate class attributes.
• Register classes automatically.
• Enforce coding rules.
• Modify methods during class creation.
• Build reusable frameworks.
• Implement Object-Relational Mapping (ORM).

Metaclasses allow these customizations to happen automatically whenever a class is created.

This makes them valuable for framework developers and advanced library design.
""",
    ),

    TopicSection(
      title: "Everything in Python is an Object",
      content: """
One of Python's core ideas is that everything is an object.

Examples include:

• Integers
• Strings
• Lists
• Dictionaries
• Functions
• Classes

Even classes themselves are objects.

Because classes are objects, they can be:

• Assigned to variables.
• Passed as arguments.
• Returned from functions.
• Modified dynamically.

This ability makes metaclasses possible.
""",
    ),

    TopicSection(
      title: "Classes are Objects",
      content: """
Many beginners think only instances are objects.

In Python, classes are also objects.

When you define a class, Python creates an object representing that class.

Later, when you create an instance, that class object creates the new object.

This relationship can be summarized as:

Metaclass → Class → Object

Understanding this relationship is essential before learning custom metaclasses.
""",
      exampleCode: """
class Student:
    pass


print(type(Student))
""",
      output: """
<class 'type'>
""",
    ),

    TopicSection(
      title: "The type() Function",
      content: """
The built-in type() function serves two different purposes.

First, it returns the type of an existing object.

Second, it can dynamically create entirely new classes.

This second capability makes type() Python's default metaclass.

Every normal Python class is ultimately created using type().
""",
      syntax: """
type(object)

type(
    class_name,
    bases,
    attributes
)
""",
      exampleCode: """
number = 10

print(type(number))

print(type(str))

print(type(list))
""",
      output: """
<class 'int'>
<class 'type'>
<class 'type'>
""",
    ),

    TopicSection(
      title: "The Default Metaclass",
      content: """
Python automatically creates every normal class using the built-in type metaclass.

For example, when you write:

class Student:
    pass

Python internally performs a similar operation using type().

This automatic behavior is usually invisible to programmers.

Only when developers need custom class creation behavior do they define their own metaclasses.
""",
    ),

    TopicSection(
      title: "Creating Classes Dynamically",
      content: """
Because type() is itself a metaclass, it can create classes dynamically during program execution.

Instead of writing a class using the class keyword, developers can create it by calling type() directly.

Dynamic class creation is useful in advanced libraries, code generation tools, and frameworks.

Although it is rarely required in everyday programming, understanding it provides insight into how Python creates classes internally.
""",
      exampleCode: """
Student = type(
    "Student",
    (),
    {}
)

student = Student()

print(type(student))
""",
      output: """
<class '__main__.Student'>
""",
    ),

    TopicSection(
      title: "Metaclass Hierarchy",
      content: """
Python's object creation follows a hierarchy.

Object

An instance created from a class.

----------------------------------------

Class

Creates objects.

----------------------------------------

Metaclass

Creates classes.

This hierarchy can be represented as:

Metaclass
      ↓
Class
      ↓
Object

Understanding this hierarchy makes advanced Python concepts much easier to learn.
""",
    ),
    TopicSection(
      title: "Custom Metaclasses",
      content: """
Although Python automatically uses the built-in type metaclass, developers can create their own metaclasses.

A custom metaclass allows developers to control how classes are created.

Instead of simply accepting Python's default behavior, a metaclass can:

• Validate class definitions.
• Add new attributes.
• Modify methods.
• Register classes automatically.
• Enforce programming rules.

Custom metaclasses are mainly used in advanced frameworks, libraries, and large software systems.
""",
    ),

    TopicSection(
      title: "Creating a Custom Metaclass",
      content: """
A custom metaclass is created by inheriting from Python's built-in type class.

Since type is itself a class, it can be extended just like any other class.

Every custom metaclass ultimately inherits from type.

After creating the metaclass, it can be assigned to any class using the metaclass keyword.
""",
      syntax: """
class MetaClass(type):
    pass
""",
    ),

    TopicSection(
      title: "Using the metaclass Keyword",
      content: """
Python allows a class to specify which metaclass should create it.

This is done using the metaclass keyword inside the class definition.

When Python encounters the class, it calls the specified metaclass instead of the default type metaclass.

Every object created from that class is then affected by the behavior defined inside the custom metaclass.
""",
      syntax: """
class Student(
    metaclass=MetaClass
):
    pass
""",
      exampleCode: """
class Meta(type):
    pass


class Student(
    metaclass=Meta
):
    pass


print(type(Student))
""",
      output: """
<class '__main__.Meta'>
""",
    ),

    TopicSection(
      title: "The __new__() Method",
      content: """
The __new__() method is responsible for creating a new class object.

When Python creates a class, it first calls the metaclass's __new__() method.

Inside this method, developers can inspect or modify the class before it is actually created.

The __new__() method receives:

• The metaclass.
• The class name.
• Base classes.
• Class attributes.

After performing any custom logic, it returns the newly created class object.
""",
      syntax: """
def __new__(
    cls,
    name,
    bases,
    attributes
):
    return super().__new__(
        cls,
        name,
        bases,
        attributes
    )
""",
    ),

    TopicSection(
      title: "The __init__() Method",
      content: """
After the class object has been created, Python automatically calls the metaclass's __init__() method.

Unlike __new__(), which creates the class, __init__() initializes it.

Developers often use __init__() to perform additional configuration after the class has been created.

Although both methods are available, most metaclass customization is performed inside __new__().
""",
      syntax: """
def __init__(
    cls,
    name,
    bases,
    attributes
):
    super().__init__(
        name,
        bases,
        attributes
    )
""",
    ),

    TopicSection(
      title: "Modifying Classes Automatically",
      content: """
One of the biggest advantages of metaclasses is the ability to modify classes automatically during creation.

For example, a metaclass can:

• Add new methods.
• Add class variables.
• Rename attributes.
• Validate class names.
• Register classes.
• Modify existing methods.

This customization happens before the class is used anywhere in the program.

As a result, every object created from that class automatically benefits from the modifications.
""",
    ),

    TopicSection(
      title: "Example: Adding an Attribute Automatically",
      content: """
The following example shows a metaclass automatically adding a new class attribute during class creation.

The programmer never explicitly defines the attribute inside the class.

Instead, the metaclass inserts it automatically.
""",
      exampleCode: """
class Meta(type):

    def __new__(
        cls,
        name,
        bases,
        attributes
    ):
        attributes["language"] = "Python"

        return super().__new__(
            cls,
            name,
            bases,
            attributes
        )


class Student(
    metaclass=Meta
):
    pass


print(Student.language)
""",
      output: """
Python
""",
    ),

    TopicSection(
      title: "Validating Classes with Metaclasses",
      content: """
Metaclasses can also validate classes before they are created.

For example, a metaclass may require that every class:

• Defines specific methods.
• Uses certain naming conventions.
• Contains required attributes.
• Inherits from a particular base class.

If a class violates these rules, the metaclass can raise an exception during class creation.

This helps enforce consistent coding standards across large applications.
""",
    ),

    TopicSection(
      title: "Why Frameworks Use Metaclasses",
      content: """
Many popular Python frameworks use metaclasses internally.

Examples include:

• Django ORM
• SQLAlchemy
• Pydantic
• Marshmallow
• Django Forms
• Django Admin

Metaclasses allow these frameworks to automatically inspect classes, register models, validate fields, and generate additional functionality without requiring developers to write repetitive code.

Although application developers rarely create custom metaclasses, they frequently use libraries that depend on them.
""",
    ),
    TopicSection(
      title: "Metaclass vs Class",
      content: """
Although classes and metaclasses are closely related, they have different responsibilities.

Class

• Creates objects.
• Defines the properties and behavior of objects.
• Used in almost every Python program.

----------------------------------------

Metaclass

• Creates classes.
• Controls how classes are created.
• Used mainly in frameworks and advanced libraries.

Relationship:

Metaclass → Class → Object

A metaclass creates a class, and the class creates objects.

Understanding this relationship helps explain why metaclasses are often called "classes of classes."
""",
    ),

    TopicSection(
      title: "Metaclass vs Decorator",
      content: """
Both metaclasses and decorators can modify classes, but they operate differently.

Class Decorator

• Modifies an already-created class.
• Simpler to understand.
• Easier to implement.
• Suitable for most customization tasks.

----------------------------------------

Metaclass

• Controls class creation itself.
• Executes before the class is fully created.
• More powerful.
• More complex.

Whenever a class decorator can solve the problem, it is usually preferred because it is easier to read and maintain.

Metaclasses should be reserved for situations where controlling the class creation process is necessary.
""",
    ),

    TopicSection(
      title: "Real-World Use Cases",
      content: """
Although custom metaclasses are uncommon in everyday applications, they are heavily used in advanced frameworks.

Common use cases include:

• Automatically registering classes.
• Object-Relational Mapping (ORM).
• Validating class definitions.
• Creating plugin systems.
• Enforcing coding standards.
• Automatically adding methods or attributes.
• Serialization frameworks.
• Dependency injection frameworks.

Many Python developers use metaclasses indirectly through popular libraries without realizing it.
""",
    ),

    TopicSection(
      title: "Advantages of Metaclasses",
      content: """
Metaclasses provide several advantages.

• Customize class creation.
• Automatically modify classes.
• Reduce repetitive code.
• Enforce application-wide rules.
• Improve framework flexibility.
• Support automatic class registration.
• Enable advanced library features.

These capabilities make metaclasses valuable when building reusable frameworks and large software systems.
""",
    ),

    TopicSection(
      title: "Disadvantages of Metaclasses",
      content: """
Despite their power, metaclasses also introduce challenges.

• Difficult for beginners to understand.
• Can make code harder to read.
• Increase application complexity.
• Debugging becomes more challenging.
• Often unnecessary for small projects.

For most applications, inheritance, decorators, or composition provide simpler solutions.

Metaclasses should be used only when they solve a genuine design problem.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when working with metaclasses.

• Use metaclasses only when necessary.
• Prefer decorators for simple class modifications.
• Keep metaclass logic small and focused.
• Document custom metaclasses clearly.
• Avoid modifying classes unnecessarily.
• Test metaclass behavior carefully.
• Use meaningful names for metaclasses.
• Understand inheritance before using metaclasses.

Following these practices helps keep advanced code understandable and maintainable.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates a custom metaclass that automatically adds a class attribute whenever a new class is created.
""",
      exampleCode: """
class Meta(type):

    def __new__(
        cls,
        name,
        bases,
        attributes
    ):
        attributes["version"] = "1.0"

        return super().__new__(
            cls,
            name,
            bases,
            attributes
        )


class Application(
    metaclass=Meta
):
    pass


print(Application.version)
""",
      output: """
1.0
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned about metaclasses, one of Python's most advanced features.

You learned:

• What metaclasses are.
• Why metaclasses are useful.
• Classes as objects.
• The type() function.
• The default metaclass.
• Dynamic class creation.
• Custom metaclasses.
• The metaclass keyword.
• The __new__() method.
• The __init__() method.
• Automatic class modification.
• Class validation.
• Framework use cases.
• Metaclass vs Class.
• Metaclass vs Decorator.
• Advantages and disadvantages.
• Best practices.

Metaclasses provide complete control over how classes are created. Although they are rarely needed in everyday programming, they are fundamental to many powerful Python frameworks and libraries. Understanding metaclasses gives developers a deeper understanding of Python's object model and prepares them to work with advanced framework internals.
""",
    ),
  ],
  quizQuestions: metaclassesQuiz,
);