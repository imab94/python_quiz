import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:python_quiz/models/app_notification.dart';
import 'package:python_quiz/services/notification_service.dart';
import 'package:python_quiz/widgets/app_background.dart';
import 'package:python_quiz/widgets/notifications/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isLoading = true;
  bool _isClearing = false;

  List<AppNotification> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  /// =========================================
  /// LOAD NOTIFICATIONS
  /// =========================================

  Future<void> _loadNotifications() async {
    final notifications =
    await NotificationService.getNotifications();

    if (!mounted) return;

    setState(() {
      _notifications = notifications;
      _isLoading = false;
    });
  }

  /// =========================================
  /// DELETE ONE NOTIFICATION
  /// =========================================

  Future<void> _deleteNotification(
      AppNotification notification,
      ) async {
    /// Dismissible has already removed the widget from
    /// the tree, so remove it from the local source list
    /// immediately as well.
    setState(() {
      _notifications.removeWhere(
            (item) => item.id == notification.id,
      );
    });

    await NotificationService.deleteNotification(
      notification.id,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Notification deleted."),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _restoreNotification(notification);
          },
        ),
      ),
    );
  }

  /// =========================================
  /// RESTORE DELETED NOTIFICATION
  /// =========================================

  Future<void> _restoreNotification(
      AppNotification notification,
      ) async {
    /// Since the screen has already been opened,
    /// restore it as read.
    final restoredNotification = notification.copyWith(
      isRead: true,
    );

    await NotificationService.addNotification(
      restoredNotification,
    );

    if (!mounted) return;

    setState(() {
      _notifications.add(restoredNotification);

      _notifications.sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
      );
    });
  }

  /// =========================================
  /// CLEAR ALL CONFIRMATION
  /// =========================================

  Future<void> _showClearAllDialog() async {
    if (_notifications.isEmpty || _isClearing) {
      return;
    }

    final shouldClear = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            "Clear all notifications?",
          ),
          content: const Text(
            "This will permanently remove all notifications.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text(
                "Clear All",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (shouldClear != true || !mounted) {
      return;
    }

    await _clearAllNotifications();
  }

  /// =========================================
  /// CLEAR ALL
  /// =========================================

  Future<void> _clearAllNotifications() async {
    setState(() {
      _isClearing = true;
    });

    await NotificationService.clearAll();

    if (!mounted) return;

    setState(() {
      _notifications.clear();
      _isClearing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("All notifications cleared."),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// =========================================
  /// BUILD
  /// =========================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              /// =========================================
              /// HEADER
              /// =========================================

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  12,
                  16,
                  12,
                ),
                child: Row(
                  children: [
                    IconButton(
                      tooltip: "Back",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        "Notifications",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    if (!_isLoading &&
                        _notifications.isNotEmpty)
                      TextButton(
                        onPressed: _isClearing
                            ? null
                            : _showClearAllDialog,
                        child: _isClearing
                            ? const SizedBox(
                          width: 18,
                          height: 18,
                          child:
                          CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                            : Text(
                          "Clear All",
                          style: GoogleFonts.lato(
                            color: Colors.white70,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              /// =========================================
              /// BODY
              /// =========================================

              Expanded(
                child: _buildBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_notifications.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _loadNotifications,
      child: ListView.builder(
        physics:
        const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          16,
          8,
          16,
          24,
        ),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];

          return NotificationCard(
            notification: notification,
            onTap: () async {
              if (notification.isRead) {
                return;
              }

              await NotificationService.markAsRead(
                notification.id,
              );

              if (!mounted) return;

              setState(() {
                _notifications[index] = notification.copyWith(
                  isRead: true,
                );
              });
            },

            onDismissed: () {
              _deleteNotification(notification);
            },
          );
        },
      ),
    );
  }

  /// =========================================
  /// EMPTY STATE
  /// =========================================

  Widget _buildEmptyState() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics:
          const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: .08,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white70,
                        size: 42,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "No Notifications",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Achievements, completed topics, "
                          "quiz results, streak milestones, "
                          "and certificate updates will appear here.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}