import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';

sealed class Exercise {
  final String id;
  final String name;
  final String description;
  final String iconUrl;
  final String fullImageUrl;
  final List<String> requiredLandmarks;

  const Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.fullImageUrl,
    required this.requiredLandmarks,
  });
}

class RepBasedExercise extends Exercise {
  final List<AngleRule> upRules;
  final List<AngleRule> downRules;

  const RepBasedExercise({
    required super.id,
    required super.name,
    required super.description,
    required super.iconUrl,
    required super.fullImageUrl,
    required super.requiredLandmarks,
    required this.upRules,
    required this.downRules,
  });
}

class DurationBasedExercise extends Exercise {
  final List<AngleRule> holdRules;

  const DurationBasedExercise({
    required super.id,
    required super.name,
    required super.description,
    required super.iconUrl,
    required super.fullImageUrl,
    required super.requiredLandmarks,
    required this.holdRules,
  });
}
