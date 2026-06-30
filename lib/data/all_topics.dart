import 'package:python_quiz/data/introduction/python_overview.dart';
import 'package:python_quiz/data/introduction/installation_guide.dart';

import 'package:python_quiz/data/beginner/01_variables.dart';
import 'package:python_quiz/data/beginner/02_data_types.dart';
import 'package:python_quiz/data/beginner/03_loops.dart';
import 'package:python_quiz/data/beginner/04_functions.dart';
import 'package:python_quiz/data/beginner/05_file_handling.dart';

import 'advanced/01_context_managers.dart';
import 'advanced/02_logging.dart';
import 'advanced/03_multithreading.dart';
import 'advanced/04_multiprocessing.dart';
import 'advanced/05_asyncio.dart';
import 'advanced/06_memory_management_garbage_collection.dart';
import 'advanced/07_testing.dart';
import 'advanced/08_design_patterns.dart';
import 'advanced/09_metaclasses.dart';
import 'intermediate/01_exception_handling.dart';
import 'intermediate/02_decorators.dart';
import 'intermediate/03_generators.dart';
import 'intermediate/04_iterators.dart';
import 'intermediate/oop/01_oop_introduction.dart';
import 'intermediate/oop/02_classes_and_objects.dart';
import 'intermediate/oop/03_self_and_constructor.dart';
import 'intermediate/oop/04_instance_and_class_variables.dart';
import 'intermediate/oop/05_methods_in_oop.dart';
import 'intermediate/oop/06_encapsulation.dart';
import 'intermediate/oop/07_abstraction.dart';
import 'intermediate/oop/08_polymorphism.dart';
import 'intermediate/oop/09_inheritance.dart';
import 'intermediate/oop/10_dunder_methods.dart';
import 'intermediate/oop/11_summary_oop.dart';

const allTopics = [

  // Introduction
  pythonOverviewTopic,
  installationGuideTopic,

  // Beginner
  variablesTopic,
  dataTypesTopic,
  loopsTopic,
  functionsTopic,
  fileHandlingTopic,

  // Intermediate
  oopIntroductionTopic,
  classesAndObjectsTopic,
  inheritanceTopic,
  encapsulationTopic,
  polymorphismTopic,
  abstractionTopic,
  dunderMethodsTopic,
  variablesInOOPTopic,
  oopSummaryTopic,
  selfAndConstructorTopic,
  methodsInOOPTopic,
  exceptionHandlingTopic,
  decoratorsTopic,
  generatorsTopic,
  iteratorsTopic,

  // Advanced
  contextManagersTopic,
  loggingTopic,
  multithreadingTopic,
  multiprocessingTopic,
  asyncioTopic,
  memoryManagementTopic,
  testingTopic,
  designPatternsTopic,
  metaclassesTopic,
];
