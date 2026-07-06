import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/app_notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.onDismissed,
    this.onTap,
  });

  final AppNotification notification;
  final VoidCallback onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final visual = _getVisual(notification.type);

    return Dismissible(
      key: ValueKey(notification.id),

      /// Swipe left -> right only.
      direction: DismissDirection.startToEnd,

      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: .85),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 8),
            Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      onDismissed: (_) {
        onDismissed();
      },

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: notification.isRead
                  ? Colors.white.withValues(alpha: .06)
                  : Colors.white.withValues(alpha: .11),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: notification.isRead
                    ? Colors.white.withValues(alpha: .08)
                    : visual.color.withValues(alpha: .35),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// =========================
                /// NOTIFICATION ICON
                /// =========================
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: visual.color.withValues(alpha: .14),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    visual.icon,
                    color: visual.color,
                    size: 25,
                  ),
                ),

                const SizedBox(width: 14),

                /// =========================
                /// NOTIFICATION CONTENT
                /// =========================
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: notification.isRead
                                    ? FontWeight.w600
                                    : FontWeight.bold,
                              ),
                            ),
                          ),

                          if (!notification.isRead) ...[
                            const SizedBox(width: 8),

                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(top: 6),
                              decoration: BoxDecoration(
                                color: visual.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: 5),

                      Text(
                        notification.message,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 9),

                      Text(
                        _formatRelativeTime(notification.createdAt),
                        style: GoogleFonts.lato(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _NotificationVisual _getVisual(AppNotificationType type) {
    return switch (type) {
      AppNotificationType.achievementUnlocked =>
      const _NotificationVisual(
        icon: Icons.emoji_events_rounded,
        color: Colors.amber,
      ),

      AppNotificationType.topicCompleted =>
      const _NotificationVisual(
        icon: Icons.menu_book_rounded,
        color: Colors.greenAccent,
      ),

      AppNotificationType.quizPassed =>
      const _NotificationVisual(
        icon: Icons.check_circle_rounded,
        color: Colors.lightBlueAccent,
      ),

      AppNotificationType.perfectScore =>
      const _NotificationVisual(
        icon: Icons.workspace_premium_rounded,
        color: Colors.orangeAccent,
      ),

      AppNotificationType.certificateUnlocked =>
      const _NotificationVisual(
        icon: Icons.school_rounded,
        color: Colors.purpleAccent,
      ),

      AppNotificationType.streakMilestone =>
      const _NotificationVisual(
        icon: Icons.local_fire_department_rounded,
        color: Colors.deepOrangeAccent,
      ),
    };
  }

  String _formatRelativeTime(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.isNegative) {
      return "Just now";
    }

    if (difference.inSeconds < 60) {
      return "Just now";
    }

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m ago";
    }

    if (difference.inHours < 24) {
      return "${difference.inHours}h ago";
    }

    if (difference.inDays == 1) {
      return "Yesterday";
    }

    if (difference.inDays < 7) {
      return "${difference.inDays}d ago";
    }

    if (difference.inDays < 30) {
      return "${difference.inDays ~/ 7}w ago";
    }

    if (difference.inDays < 365) {
      return "${difference.inDays ~/ 30}mo ago";
    }

    return "${difference.inDays ~/ 365}y ago";
  }
}

class _NotificationVisual {
  const _NotificationVisual({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;
}