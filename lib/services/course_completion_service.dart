import 'package:shared_preferences/shared_preferences.dart';

class CourseCompletionService {
  static const _celebrationShownKey =
      "course_completion_shown";

  static const _highestCertificateKey =
      "highest_certificate_level";

  /// Returns true only once.
  static Future<bool> shouldShowCelebration() async {
    final prefs = await SharedPreferences.getInstance();

    final shown =
        prefs.getBool(_celebrationShownKey) ?? false;

    if (shown) {
      return false;
    }

    await prefs.setBool(_celebrationShownKey, true);

    return true;
  }

  static Future<String?> getHighestCertificateLevel() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_highestCertificateKey);
  }

  static Future<void> saveHighestCertificateLevel(
      String level,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _highestCertificateKey,
      level,
    );
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_celebrationShownKey);
    await prefs.remove(_highestCertificateKey);
  }
}