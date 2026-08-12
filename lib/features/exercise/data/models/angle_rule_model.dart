import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';

/// Mirrors the backend's `RuleConfig`.
class AngleRuleModel {
  final String angleName;
  final double minAngle;
  final double maxAngle;
  final String missingMessage;
  final String belowMinMessage;
  final String aboveMaxMessage;

  const AngleRuleModel({
    required this.angleName,
    required this.minAngle,
    required this.maxAngle,
    required this.missingMessage,
    required this.belowMinMessage,
    required this.aboveMaxMessage,
  });

  factory AngleRuleModel.fromJson(Map<String, dynamic> json) {
    return AngleRuleModel(
      angleName: json['angleName'] as String,
      minAngle: (json['minAngle'] as num).toDouble(),
      maxAngle: (json['maxAngle'] as num).toDouble(),
      missingMessage: json['missingMessage'] as String,
      belowMinMessage: json['belowMinMessage'] as String,
      aboveMaxMessage: json['aboveMaxMessage'] as String,
    );
  }

  AngleRule toEntity() {
    return AngleRule(
      angleName: angleName,
      minAngle: minAngle,
      maxAngle: maxAngle,
      missingMessage: missingMessage,
      belowMinMessage: belowMinMessage,
      aboveMaxMessage: aboveMaxMessage,
    );
  }
}
