import 'package:python_quiz/data/quizzes/advanced/testing_quiz.dart';
import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

const testingTopic = Topic(
  title: "Testing",
  level: "Advanced",
  priority: 29,
  isRecommended: true,
  recommendationReason: "Write reliable code by catching bugs before deployment.",
  sections: [
    TopicSection(
      title: "What is Testing?",
      content: """
Testing is the process of verifying that a program works correctly and produces the expected results.

Instead of assuming that code is correct, developers execute tests to check whether every part of the application behaves as intended.

Testing helps identify bugs before software is released to users.

A well-tested application is generally more reliable, easier to maintain, and less likely to fail in production.

Testing is an essential part of modern software development and is widely used in professional Python projects.
""",
    ),

    TopicSection(
      title: "Why is Testing Important?",
      content: """
As applications grow larger, manually checking every feature becomes difficult and time-consuming.

Testing provides confidence that recent code changes have not broken existing functionality.

Benefits of testing include:

• Detects bugs early.
• Improves software quality.
• Reduces maintenance costs.
• Prevents regression bugs.
• Makes refactoring safer.
• Increases developer confidence.
• Improves code reliability.

Well-written tests save significant time during software development.
""",
    ),

    TopicSection(
      title: "Types of Testing",
      content: """
Software testing can be performed at different levels.

The most common types are:

• Unit Testing
• Integration Testing
• Functional Testing
• System Testing
• Acceptance Testing

Each type focuses on verifying a different aspect of the application.

Together, they help ensure that the entire system behaves correctly.
""",
    ),

    TopicSection(
      title: "Unit Testing",
      content: """
Unit Testing verifies individual components of an application.

A unit is usually a single function, method, or class.

Each unit is tested independently from the rest of the application.

Because unit tests are small and focused, they are fast to execute and easy to maintain.

Unit testing is the foundation of automated testing.
""",
    ),

    TopicSection(
      title: "Integration Testing",
      content: """
Integration Testing verifies that multiple components work correctly together.

Instead of testing a single function, integration tests examine interactions between different modules.

Examples include:

• API communicating with a database.
• User authentication.
• Payment processing.
• File uploads.

Integration testing helps detect problems that unit tests cannot identify.
""",
    ),

    TopicSection(
      title: "Functional Testing",
      content: """
Functional Testing verifies that the application behaves according to its functional requirements.

Instead of focusing on internal implementation, functional tests verify the expected behavior from the user's perspective.

Examples include:

• User login.
• Creating an account.
• Searching products.
• Placing an order.

Functional testing ensures that application features work as expected.
""",
    ),

    TopicSection(
      title: "Manual Testing vs Automated Testing",
      content: """
Testing can be performed manually or automatically.

Manual Testing

• Performed by humans.
• Slower.
• Suitable for exploratory testing.
• Can be repetitive.

----------------------------------------

Automated Testing

• Performed by software.
• Faster.
• Repeatable.
• Suitable for continuous integration.
• Preferred for large applications.

Modern software development relies heavily on automated testing.
""",
    ),

    TopicSection(
      title: "Python's unittest Module",
      content: """
Python includes a built-in testing framework called unittest.

The unittest module provides everything needed to write, organize, and execute automated tests.

Some important components include:

• TestCase
• Assertions
• Test Suites
• Test Runner

Because unittest is included with Python, no additional installation is required.
""",
      syntax: """
import unittest
""",
      exampleCode: """
import unittest


class TestExample(unittest.TestCase):

    def test_sample(self):
        self.assertEqual(2 + 2, 4)


unittest.main()
""",
      output: """
.
----------------------------------------------------------------------
Ran 1 test in 0.001s

OK
""",
    ),
    TopicSection(
      title: "The TestCase Class",
      content: """
The TestCase class is the foundation of Python's unittest framework.

Every test class should inherit from unittest.TestCase.

The TestCase class provides methods for:

• Writing test cases.
• Comparing expected and actual results.
• Organizing tests.
• Reporting failures.

Each test method inside a TestCase class should begin with the word test.

The unittest framework automatically discovers and executes these methods.
""",
      syntax: """
import unittest

class TestClass(unittest.TestCase):
    pass
""",
    ),

    TopicSection(
      title: "Writing Test Methods",
      content: """
A test method verifies that a specific part of the program behaves correctly.

Every test method must start with the prefix test.

Each test should focus on one behavior or one expected result.

Keeping test methods small and independent makes them easier to understand and maintain.
""",
      exampleCode: """
import unittest


class TestMath(unittest.TestCase):

    def test_addition(self):
        self.assertEqual(10 + 20, 30)


unittest.main()
""",
      output: """
.
----------------------------------------------------------------------
Ran 1 test

OK
""",
    ),

    TopicSection(
      title: "Assertions",
      content: """
Assertions compare the expected result with the actual result.

If the comparison succeeds, the test passes.

If the comparison fails, unittest reports a test failure.

Assertions are the most important part of every unit test because they determine whether the code behaves correctly.
""",
    ),

    TopicSection(
      title: "Common Assertion Methods",
      content: """
The unittest framework provides many assertion methods.

Some of the most commonly used methods include:

• assertEqual()
• assertNotEqual()
• assertTrue()
• assertFalse()
• assertIs()
• assertIsNone()
• assertIn()
• assertNotIn()
• assertRaises()

Choosing the correct assertion makes tests easier to read and understand.
""",
      exampleCode: """
import unittest


class TestAssertions(unittest.TestCase):

    def test_values(self):
        self.assertEqual(5, 5)
        self.assertTrue(10 > 5)
        self.assertIn(
            "Python",
            ["Python", "Java"]
        )


unittest.main()
""",
      output: """
.
----------------------------------------------------------------------
Ran 1 test

OK
""",
    ),

    TopicSection(
      title: "The setUp() Method",
      content: """
The setUp() method is executed before every test method.

It is commonly used to prepare objects or data required by multiple tests.

Instead of writing the same initialization code repeatedly, developers place it inside setUp().

This improves readability and reduces code duplication.
""",
      syntax: """
def setUp(self):
    pass
""",
      exampleCode: """
import unittest


class TestExample(unittest.TestCase):

    def setUp(self):
        self.number = 10

    def test_value(self):
        self.assertEqual(
            self.number,
            10
        )


unittest.main()
""",
      output: """
.
----------------------------------------------------------------------
Ran 1 test

OK
""",
    ),

    TopicSection(
      title: "The tearDown() Method",
      content: """
The tearDown() method is executed after every test method.

It is commonly used to clean up resources created during testing.

Examples include:

• Closing files.
• Disconnecting databases.
• Removing temporary files.
• Releasing network connections.

Using tearDown() helps ensure that each test starts with a clean environment.
""",
      syntax: """
def tearDown(self):
    pass
""",
    ),

    TopicSection(
      title: "Test Discovery",
      content: """
The unittest framework can automatically discover test files and execute all test cases.

By default, unittest searches for files whose names begin with test.

Automatic test discovery allows developers to organize large projects without manually running every test file.

It is widely used in professional software development.
""",
      syntax: """
python -m unittest discover
""",
    ),

    TopicSection(
      title: "Running Tests",
      content: """
Tests can be executed in several ways.

Common approaches include:

• Running the test file directly.
• Using python -m unittest.
• Using unittest discovery.
• Running tests from an IDE.

Automated testing tools and Continuous Integration (CI) systems also execute tests automatically whenever code changes are made.
""",
      syntax: """
python -m unittest
""",
    ),
    TopicSection(
      title: "Mocking",
      content: """
Sometimes a function depends on external resources such as databases, APIs, files, or network services.

Using these resources during testing can make tests slow, unreliable, or difficult to execute.

Mocking replaces these real dependencies with simulated objects that behave in a predictable way.

This allows developers to test application logic without depending on external systems.

Mocking is widely used in professional software development to create fast, reliable, and isolated unit tests.
""",
    ),

    TopicSection(
      title: "The unittest.mock Module",
      content: """
Python provides the built-in unittest.mock module for creating mock objects.

Mock objects imitate the behavior of real objects while allowing developers to control their responses.

The unittest.mock module provides several useful tools, including:

• Mock
• MagicMock
• patch()

These tools make it possible to test code that interacts with external systems without actually using those systems.
""",
      syntax: """
from unittest import mock
""",
    ),

    TopicSection(
      title: "The patch() Function",
      content: """
The patch() function temporarily replaces an object during a test.

After the test finishes, the original object is automatically restored.

This is useful when testing functions that interact with:

• APIs
• Databases
• File systems
• Third-party libraries

Using patch() helps isolate the code being tested from external dependencies.
""",
      syntax: """
from unittest.mock import patch
""",
      exampleCode: """
from unittest.mock import patch


with patch("builtins.print") as mock_print:

    print("Hello")

    mock_print.assert_called_once_with(
        "Hello"
    )
""",
    ),

    TopicSection(
      title: "MagicMock",
      content: """
MagicMock is a specialized mock object that automatically supports many Python special methods.

It behaves much like a real object while allowing developers to inspect how it was used.

MagicMock is especially useful when mocking complex objects or libraries because it requires very little setup.
""",
      exampleCode: """
from unittest.mock import MagicMock


calculator = MagicMock()

calculator.add.return_value = 30

print(calculator.add(10, 20))
""",
      output: """
30
""",
    ),

    TopicSection(
      title: "pytest",
      content: """
Although unittest is Python's built-in testing framework, many developers prefer pytest.

Pytest offers:

• Simpler syntax.
• Less boilerplate code.
• Powerful fixtures.
• Better error reporting.
• Automatic test discovery.
• Rich plugin ecosystem.

Pytest can also execute tests written using unittest, making migration easy.

Today, pytest is one of the most widely used testing frameworks in the Python community.
""",
      syntax: """
pip install pytest
""",
    ),

    TopicSection(
      title: "Fixtures",
      content: """
Fixtures provide reusable setup code for tests.

Instead of repeating initialization code in every test, fixtures prepare the required environment before a test runs.

Common uses include:

• Creating database connections.
• Loading test data.
• Creating temporary files.
• Initializing application objects.

Fixtures improve readability and reduce duplicated code.
""",
    ),

    TopicSection(
      title: "Code Coverage",
      content: """
Code Coverage measures how much of the application's source code is executed during testing.

Higher code coverage generally indicates that more of the application has been tested.

However, high coverage alone does not guarantee bug-free software.

Developers should focus on writing meaningful tests rather than simply increasing the coverage percentage.

Popular tools such as coverage.py can generate detailed coverage reports.
""",
    ),

    TopicSection(
      title: "Best Practices",
      content: """
Follow these best practices when writing tests.

• Write small and focused tests.
• Test one behavior at a time.
• Use descriptive test names.
• Keep tests independent.
• Mock external services.
• Test both expected and unexpected inputs.
• Run tests frequently.
• Maintain high-quality test coverage.
• Keep test code as clean as production code.

Following these practices results in reliable and maintainable test suites.
""",
    ),

    TopicSection(
      title: "Complete Example",
      content: """
The following example demonstrates a simple unit test using the unittest framework.
""",
      exampleCode: """
import unittest


def add(a, b):
    return a + b


class TestMath(unittest.TestCase):

    def test_add(self):
        self.assertEqual(
            add(10, 20),
            30
        )


if __name__ == "__main__":
    unittest.main()
""",
      output: """
.
----------------------------------------------------------------------
Ran 1 test

OK
""",
    ),

    TopicSection(
      title: "Summary",
      content: """
In this lesson, you learned the fundamentals of software testing in Python.

You learned:

• What testing is.
• Why testing is important.
• Types of testing.
• Unit testing.
• Integration testing.
• Functional testing.
• Manual and automated testing.
• The unittest framework.
• TestCase.
• Assertions.
• setUp() and tearDown().
• Test discovery.
• Running tests.
• Mocking.
• The unittest.mock module.
• patch().
• MagicMock.
• pytest.
• Fixtures.
• Code coverage.
• Best practices.

Testing is an essential part of professional software development. Well-designed tests help developers detect bugs early, improve software quality, simplify maintenance, and ensure that applications continue to work correctly as they evolve.
""",
    ),
  ],
  quizQuestions: testingQuiz,
);