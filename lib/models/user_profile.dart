class UserProfile {
  const UserProfile({
    required this.profileId,
    required this.name,
    required this.country,
    required this.createdAt,
    this.photoPath,
    required this.countryCode,
    required this.countryFlag,
  });

  /// Unique learner ID
  /// Example: PLP-20260708-483729
  final String profileId;

  /// Full name of the learner
  final String name;

  /// Country selected by the learner
  final String country;

  /// Local path of the profile photo
  /// Null means default avatar
  final String? photoPath;

  /// Date when the profile was first created
  final DateTime createdAt;

  //Country Code
  final String countryCode;

  // Country Flag
  final String countryFlag;

  UserProfile copyWith({
    String? profileId,
    String? name,
    String? country,
    String? photoPath,
    DateTime? createdAt,
    String? countryCode,
    String? countryFlag,
  }) {
    return UserProfile(
      profileId: profileId ?? this.profileId,
      name: name ?? this.name,
      country: country ?? this.country,
      photoPath: photoPath ?? this.photoPath,
      createdAt: createdAt ?? this.createdAt,
      countryCode: countryCode ?? this.countryCode,
      countryFlag: countryFlag ?? this.countryFlag,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileId': profileId,
      'name': name,
      'country': country,
      'photoPath': photoPath,
      'createdAt': createdAt.toIso8601String(),
      'countryCode': countryCode,
      'countryFlag': countryFlag,
    };
  }

  factory UserProfile.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserProfile(
      profileId: json['profileId'] as String,
      name: json['name'] as String,
      country: json['country'] as String,
      countryCode: json['countryCode'],
      countryFlag: json['countryFlag'],
      photoPath: json['photoPath'] as String?,
      createdAt: DateTime.parse(
        json['createdAt'] as String,

      ),
    );
  }
}