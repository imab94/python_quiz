import 'package:shared_preferences/shared_preferences.dart';

class XPService {
  static const _xpKey = "total_xp";

  static const _achievementXPKey = "achievement_xp";
  static const _activityXPKey = "activity_xp";

  // ==========================
  // Total XP
  // ==========================

  static Future<void> addXP(int xp) async {
    final prefs = await SharedPreferences.getInstance();

    final currentXP = prefs.getInt(_xpKey) ?? 0;

    await prefs.setInt(
      _xpKey,
      currentXP + xp,
    );
  }

  static Future<int> getTotalXP() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_xpKey) ?? 0;
  }

  // ==========================
  // Achievement XP
  // ==========================

  static Future<void> addAchievementXP(int xp) async {
    final prefs = await SharedPreferences.getInstance();

    final current =
        prefs.getInt(_achievementXPKey) ?? 0;

    await prefs.setInt(
      _achievementXPKey,
      current + xp,
    );

    // Keep total XP updated
    await addXP(xp);
  }

  static Future<int> getAchievementXP() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_achievementXPKey) ?? 0;
  }

  // ==========================
  // Activity XP
  // ==========================

  static Future<void> addActivityXP(int xp) async {
    final prefs = await SharedPreferences.getInstance();

    final current =
        prefs.getInt(_activityXPKey) ?? 0;

    await prefs.setInt(
      _activityXPKey,
      current + xp,
    );

    // Keep total XP updated
    await addXP(xp);
  }

  static Future<int> getActivityXP() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_activityXPKey) ?? 0;
  }

  // ==========================
  // Reset
  // ==========================

  static Future<void> resetXP() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_xpKey);
    await prefs.remove(_achievementXPKey);
    await prefs.remove(_activityXPKey);
  }
}