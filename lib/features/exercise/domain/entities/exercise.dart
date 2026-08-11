import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';

sealed class Exercise {
  final String id;
  final String name;
  final List<String> requiredLandmarks;

  const Exercise({
    required this.id,
    required this.name,
    required this.requiredLandmarks,
  });
}

class RepBasedExercise extends Exercise {
  final List<AngleRule> upRules;
  final List<AngleRule> downRules;

  const RepBasedExercise({
    required super.id,
    required super.name,
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
    required super.requiredLandmarks,
    required this.holdRules,
  });
}
