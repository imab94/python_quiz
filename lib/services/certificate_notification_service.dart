import 'package:shared_preferences/shared_preferences.dart';

class CertificateNotificationService {
  static const _key = "certificate_notifications";

  static Future<bool> shouldNotify(String level) async {
    final prefs = await SharedPreferences.getInstance();

    final notified = prefs.getStringList(_key) ?? [];

    if (notified.contains(level)) {
      return false;
    }

    notified.add(level);

    await prefs.setStringList(_key, notified);

    return true;
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }
}