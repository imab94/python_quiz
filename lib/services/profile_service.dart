import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:python_quiz/models/user_profile.dart';

class ProfileService {
  static const _profileKey = 'user_profile';

  /// Returns true if a profile already exists.
  static Future<bool> hasProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_profileKey);
  }

  /// Save the learner profile.
  static Future<void> saveProfile(
      UserProfile profile,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _profileKey,
      jsonEncode(profile.toJson()),
    );
  }

  /// Load the learner profile.
  static Future<UserProfile?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_profileKey);

    if (json == null) {
      return null;
    }

    return UserProfile.fromJson(
      jsonDecode(json),
    );
  }

  static Future<String> getLearnerName() async {
    final profile = await getProfile();
    return profile?.name ?? "Python Learner";
  }

  /// Update an existing learner profile.
  static Future<void> updateProfile(
      UserProfile profile,
      ) async {
    await saveProfile(profile);
  }

  /// Delete the profile.
  static Future<void> deleteProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_profileKey);
  }

  /// Generates a unique learner ID.
  ///
  /// Example:
  /// PLP-20260708-483729
  static String generateProfileId() {
    const uuid = Uuid();
    final id = uuid.v4().replaceAll('-', '');
    return "PLP-${id.substring(0, 12).toUpperCase()}";
  }
}