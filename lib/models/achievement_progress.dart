class AchievementProgress {
  const AchievementProgress({
    required this.current,
    required this.target,
  });

  final int current;
  final int target;

  double get percentage {
    if (target == 0) return 0;

    final value = current / target;

    return value.clamp(0.0, 1.0);
  }
}