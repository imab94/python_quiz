import 'package:python_quiz/models/topic.dart';
import 'package:python_quiz/models/topic_section.dart';

import '../quizzes/introduction/installation_quiz.dart';

const installationGuideTopic = Topic(
  title: "Python Installation Guide",
  level: "Introduction",
  sections: [
    TopicSection(
      title: "Introduction",
      content: """
Python installation is the process of downloading and setting up Python on your computer so you can write and run Python programs.

Before writing Python programs, you must install Python correctly on your operating system.

During installation, you should enable the 'Add Python to PATH' option. This allows Python to be accessed from the command line or terminal.

After installation, you can verify that Python has been installed successfully by checking its version.
""",
    ),

    TopicSection(
      title: "Check Python Installation",
      content: """
Once Python is installed, open Command Prompt (Windows) or Terminal (macOS/Linux) and run the following command to verify the installation.
""",
      syntax: """
python --version

# or

python3 --version
""",
      exampleCode: """
import sys

print("Python is installed successfully.")
print("Python version:", sys.version.split()[0])
""",
      output: """
Python is installed successfully.
Python version: 3.x.x
""",
    ),
  ],
  quizQuestions: installationQuiz,
);