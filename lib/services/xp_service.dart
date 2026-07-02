import 'package:shared_preferences/shared_preferences.dart';

class XPService {
  static const _xpKey = "total_xp";

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

  static Future<void> resetXP() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_xpKey);
  }
}