import 'package:flutter/material.dart';
import 'package:python_quiz/models/achievement.dart';

const List<Achievement> allAchievements = [

  // =========================
  // Learning
  // =========================

  Achievement(
    id: "first_topic",
    title: "First Topic",
    description: "Complete your first learning topic.",
    icon: Icons.menu_book_rounded,
    color: Colors.amber,
    xp: 20,
  ),

  Achievement(
    id: "learning_momentum",
    title: "Learning Momentum",
    description: "Complete 5 learning topics.",
    icon: Icons.trending_up_rounded,
    color: Colors.teal,
    xp: 40,
  ),


  Achievement(
    id: "ten_topics",
    title: "Topic Explorer",
    description: "Complete 10 learning topics.",
    icon: Icons.auto_stories,
    color: Colors.orange,
    xp: 60,
  ),

  Achievement(
    id: "consistent_learner",
    title: "Consistent Learner",
    description: "Complete 15 learning topics.",
    icon: Icons.auto_graph_rounded,
    color: Colors.pinkAccent,
    xp: 80,
  ),

  Achievement(
    id: "knowledge_builder",
    title: "Knowledge Builder",
    description: "Complete 20 learning topics.",
    icon: Icons.architecture_rounded,
    color: Colors.green,
    xp: 120,
  ),

  Achievement(
    id: "topic_champion",
    title: "Topic Champion",
    description: "Complete 25 learning topics.",
    icon: Icons.workspace_premium_rounded,
    color: Colors.deepPurpleAccent,
    xp: 150,
  ),

  Achievement(
    id: "all_topics",
    title: "Python Master",
    description: "Complete all learning topics.",
    icon: Icons.workspace_premium,
    color: Colors.deepOrange,
    xp: 200,
  ),

  // =========================
  // Topic Quiz
  // =========================
  Achievement(
    id: "first_quiz",
    title: "Quiz Challenger",
    description: "Complete your very first topic quiz.",
    icon: Icons.quiz_rounded,
    color: Colors.lightBlueAccent,
    xp: 20,
  ),

  Achievement(
    id: "perfect_score",
    title: "Perfect Score",
    description: "Answer every question correctly in a quiz.",
    icon: Icons.stars_rounded,
    color: Colors.amber,
    xp: 50,
  ),

  Achievement(
    id: "ten_quizzes",
    title: "Quiz Champion",
    description: "Complete 10 quizzes.",
    icon: Icons.emoji_events,
    color: Colors.deepPurple,
    xp: 100,
  ),

  // =========================
  // Random Challenge
  // =========================
  Achievement(
    id: "first_random",
    title: "Challenge Accepted",
    description: "Complete your first Random Challenge.",
    icon: Icons.bolt_rounded,
    color: Colors.cyan,
    xp: 30,
  ),

  Achievement(
    id: "beginner_challenger",
    title: "Beginner Challenger",
    description: "Complete your first Beginner Random Challenge.",
    icon: Icons.looks_one_rounded,
    color: Colors.green,
    xp: 20,
  ),

  Achievement(
    id: "intermediate_challenger",
    title: "Intermediate Challenger",
    description: "Complete your first Intermediate Random Challenge.",
    icon: Icons.looks_two_rounded,
    color: Colors.orange,
    xp: 30,
  ),

  Achievement(
    id: "advanced_challenger",
    title: "Advanced Challenger",
    description: "Complete your first Advanced Random Challenge.",
    icon: Icons.looks_3_rounded,
    color: Colors.deepPurple,
    xp: 40,
  ),

  Achievement(
    id: "mixed_master",
    title: "Mixed Master",
    description: "Complete your first Mixed Random Challenge.",
    icon: Icons.shuffle_rounded,
    color: Colors.pinkAccent,
    xp: 50,
  ),

  Achievement(
    id: "five_random",
    title: "Challenge Explorer",
    description: "Complete 5 Random Challenges.",
    icon: Icons.explore_rounded,
    color: Colors.lightBlue,
    xp: 50,
  ),

  Achievement(
    id: "ten_random",
    title: "Challenge Expert",
    description: "Complete 10 Random Challenges.",
    icon: Icons.flash_on,
    color: Colors.blueAccent,
    xp: 120,
  ),

  Achievement(
    id: "twentyfive_random",
    title: "Challenge Warrior",
    description: "Complete 25 Random Challenges.",
    icon: Icons.shield_rounded,
    color: Colors.indigo,
    xp: 180,
  ),

  Achievement(
    id: "fifty_random",
    title: "Challenge Legend",
    description: "Complete 50 Random Challenges.",
    icon: Icons.emoji_events_rounded,
    color: Colors.amber,
    xp: 300,
  ),

  Achievement(
    id: "first_pass",
    title: "First Victory",
    description: "Pass your first Random Challenge.",
    icon: Icons.check_circle_rounded,
    color: Colors.greenAccent,
    xp: 25,
  ),

  Achievement(
    id: "perfect_random",
    title: "Flawless Victory",
    description: "Score 100% in a Random Challenge.",
    icon: Icons.star_rounded,
    color: Colors.amber,
    xp: 60,
  ),

  Achievement(
    id: "three_passes",
    title: "Winning Streak",
    description: "Pass 3 Random Challenges in a row.",
    icon: Icons.local_fire_department_rounded,
    color: Colors.deepOrange,
    xp: 80,
  ),

  // =========================
  // Streak
  // =========================
  Achievement(
    id: "on_fire",
    title: "On Fire",
    description: "Maintain a 3-day learning streak.",
    icon: Icons.local_fire_department_rounded,
    color: Colors.deepOrange,
    xp: 40,
  ),

  Achievement(
    id: "learning_habit",
    title: "Learning Habit",
    description: "Maintain a 7-day learning streak.",
    icon: Icons.whatshot_rounded,
    color: Colors.orange,
    xp: 80,
  ),

  Achievement(
    id: "unstoppable",
    title: "Unstoppable",
    description: "Maintain a 30-day learning streak.",
    icon: Icons.emoji_events_rounded,
    color: Colors.redAccent,
    xp: 250,
  ),

  // =========================
  // Questions
  // =========================
  Achievement(
    id: "hundred_questions",
    title: "Question Crusher",
    description: "Answer 100 questions.",
    icon: Icons.psychology,
    color: Colors.green,
    xp: 150,
  ),

  Achievement(
    id: "thousand_questions",
    title: "Python Veteran",
    description: "Answer 1000 questions.",
    icon: Icons.military_tech,
    color: Colors.indigo,
    xp: 500,
  ),

  // daily challenge
  Achievement(
    id: "daily_challenge",
    title: "Daily Learner",
    description: "Complete a Random Challenge today.",
    icon: Icons.today_rounded,
    color: Colors.teal,
    xp: 15,
  ),

  Achievement(
    id: "weekly_challenge",
    title: "Weekly Challenger",
    description: "Complete a Random Challenge on 7 different days.",
    icon: Icons.calendar_month_rounded,
    color: Colors.deepOrange,
    xp: 100,
  ),

  Achievement(
    id: "monthly_challenge",
    title: "Monthly Master",
    description: "Complete a Random Challenge on 30 different days.",
    icon: Icons.workspace_premium_rounded,
    color: Colors.redAccent,
    xp: 250,
  ),

  // difficulty mastery

  Achievement(
    id: "difficulty_master",
    title: "Difficulty Master",
    description: "Complete Beginner, Intermediate, Advanced and Mixed Challenges.",
    icon: Icons.auto_awesome_rounded,
    color: Colors.deepPurpleAccent,
    xp: 150,
  ),

];
