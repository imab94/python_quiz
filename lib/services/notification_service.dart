import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:python_quiz/models/app_notification.dart';

class NotificationService {
  NotificationService._();

  static const String _storageKey = 'app_notifications';

  static const int _maxNotifications = 100;

  /// ================================
  /// GET ALL NOTIFICATIONS
  /// ================================

  static Future<List<AppNotification>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();

    final storedNotifications =
        prefs.getStringList(_storageKey) ?? <String>[];

    final notifications = <AppNotification>[];

    for (final storedNotification in storedNotifications) {
      try {
        final json = jsonDecode(storedNotification);

        if (json is! Map) {
          continue;
        }

        notifications.add(
          AppNotification.fromJson(
            Map<String, dynamic>.from(json),
          ),
        );
      } catch (_) {
        // Ignore corrupted notification entries.
      }
    }

    // Always return newest notifications first.
    notifications.sort(
          (a, b) => b.createdAt.compareTo(a.createdAt),
    );

    return notifications;
  }

  /// ================================
  /// ADD NOTIFICATION
  /// ================================

  static Future<void> addNotification(
      AppNotification notification,
      ) async {
    final notifications = await getNotifications();

    final alreadyExists = notifications.any(
          (item) => item.id == notification.id,
    );

    if (alreadyExists) {
      return;
    }

    notifications.insert(0, notification);

    await _saveNotifications(notifications);
  }

  /// ================================
  /// GET UNREAD COUNT
  /// ================================

  static Future<int> getUnreadCount() async {
    final notifications = await getNotifications();

    return notifications
        .where((notification) => !notification.isRead)
        .length;
  }

  /// ================================
  /// MARK ONE NOTIFICATION AS READ
  /// ================================

  static Future<void> markAsRead(String notificationId) async {
    final notifications = await getNotifications();

    var changed = false;

    final updatedNotifications = notifications.map((notification) {
      if (notification.id == notificationId &&
          !notification.isRead) {
        changed = true;

        return notification.copyWith(
          isRead: true,
        );
      }

      return notification;
    }).toList();

    if (!changed) {
      return;
    }

    await _saveNotifications(updatedNotifications);
  }

  /// ================================
  /// MARK ALL AS READ
  /// ================================

  static Future<void> markAllAsRead() async {
    final notifications = await getNotifications();

    final hasUnreadNotifications = notifications.any(
          (notification) => !notification.isRead,
    );

    if (!hasUnreadNotifications) {
      return;
    }

    final updatedNotifications = notifications
        .map(
          (notification) => notification.copyWith(
        isRead: true,
      ),
    )
        .toList();

    await _saveNotifications(updatedNotifications);
  }

  /// ================================
  /// DELETE ONE NOTIFICATION
  /// ================================

  static Future<void> deleteNotification(
      String notificationId,
      ) async {
    final notifications = await getNotifications();

    final originalLength = notifications.length;

    notifications.removeWhere(
          (notification) =>
      notification.id == notificationId,
    );

    /// Nothing was removed.
    if (notifications.length == originalLength) {
      return;
    }

    await _saveNotifications(notifications);
  }

  /// ================================
  /// CLEAR ALL NOTIFICATIONS
  /// ================================

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_storageKey);
  }

  /// ================================
  /// SAVE NOTIFICATIONS
  /// ================================

  static Future<void> _saveNotifications(
      List<AppNotification> notifications,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    /// Ensure consistent newest-first ordering.
    notifications.sort(
          (a, b) => b.createdAt.compareTo(a.createdAt),
    );

    final notificationsToSave = notifications
        .take(_maxNotifications)
        .map(
          (notification) => jsonEncode(
        notification.toJson(),
      ),
    )
        .toList();

    await prefs.setStringList(
      _storageKey,
      notificationsToSave,
    );
  }

  static Future<void> addAchievementUnlockedNotification({
    required String achievementId,
    required String achievementName,
  }) async {
    await addNotification(
      AppNotification(
        id: "achievement_$achievementId",
        type: AppNotificationType.achievementUnlocked,
        title: "Achievement Unlocked! 🏆",
        message: "You unlocked the $achievementName achievement.",
        createdAt: DateTime.now(),
        isRead: false,
      ),
    );
  }

  static Future<void> addTopicCompletedNotification({
    required String topicTitle,
  }) async {
    await addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: AppNotificationType.topicCompleted,
        title: "📘 Topic Completed",
        message: "You successfully completed $topicTitle.",
        createdAt: DateTime.now(),
        isRead: false,
      ),
    );
  }

  static Future<void> addQuizPassedNotification({
    required String topicTitle,
    required int score,
    required int totalQuestions,
  }) async {
    await addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: AppNotificationType.quizPassed,
        title: "📝 Quiz Passed",
        message: "You passed the $topicTitle quiz ($score/$totalQuestions).",
        createdAt: DateTime.now(),
        isRead: false,
      ),
    );
  }

  static Future<void> addRandomChallengePassedNotification({
    required String difficulty,
    required int score,
    required int totalQuestions,
  }) async {
    await addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: AppNotificationType.randomChallenge,
        title: "🎯 Challenge Passed",
        message:
        "You passed the ${difficulty.toUpperCase()} Challenge ($score/$totalQuestions).",
        createdAt: DateTime.now(),

        isRead: false,
      ),
    );
  }

  static Future<void> addStreakMilestoneNotification({
    required int streak,
  }) async {
    await addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: AppNotificationType.streakMilestone,
        title: "🔥 $streak-Day Streak!",
        message: "Amazing! You've learned for $streak consecutive days.",
        createdAt: DateTime.now(),
        isRead: false,
      ),
    );
  }

  static Future<void> addCertificateUnlockedNotification({
    required String certificateName,
  }) async {
    await addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: AppNotificationType.certificateUnlocked,
        title: "🎓 Certificate Unlocked!",
        message:
        "Congratulations! Your $certificateName Certificate is now available.",
        createdAt: DateTime.now(),
        isRead: false,
      ),
    );
  }

  static Future<void> addCourseCompletedNotification() async {
    await addNotification(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: AppNotificationType.courseCompleted,
        title: "🎉 Course Completed!",
        message:
        "Congratulations! You've completed the Python Learning Path.",
        createdAt: DateTime.now(),
        isRead: false,
      ),
    );
  }

}