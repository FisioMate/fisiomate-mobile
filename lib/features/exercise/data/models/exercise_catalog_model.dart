import 'package:fisiomate/features/exercise/data/models/angle_rule_model.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';

/// Mirrors the backend's `ExerciseCatalogRead`.
///
/// Deliberately doesn't parse the `angles` field — per AGENTS.md, which
/// landmarks form a named angle is app-owned data (`core/utils/angle_
/// catalog.dart`), never backend-driven, so `angles` is backend
/// documentation we don't need at runtime.
class ExerciseCatalogModel {
  final String id;
  final String name;
  final String description;
  final String fullImageUrl;
  final String iconUrl;
  final String trackingType;
  final List<String> requiredLandmarks;
  final List<AngleRuleModel> holdRule;
  final List<AngleRuleModel> upRule;
  final List<AngleRuleModel> downRule;

  const ExerciseCatalogModel({
    required this.id,
    required this.name,
    required this.description,
    required this.fullImageUrl,
    required this.iconUrl,
    required this.trackingType,
    required this.requiredLandmarks,
    required this.holdRule,
    required this.upRule,
    required this.downRule,
  });

  factory ExerciseCatalogModel.fromJson(Map<String, dynamic> json) {
    List<AngleRuleModel> parseRules(String key) {
      final raw = json[key] as List<dynamic>?;
      if (raw == null) return const [];
      return raw
          .map((rule) => AngleRuleModel.fromJson(rule as Map<String, dynamic>))
          .toList();
    }

    return ExerciseCatalogModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      fullImageUrl: json['full_image_url'] as String,
      iconUrl: json['icon_url'] as String,
      trackingType: json['trackingType'] as String,
      requiredLandmarks: (json['requiredLandmarks'] as List<dynamic>)
          .cast<String>(),
      holdRule: parseRules('holdRule'),
      upRule: parseRules('upRule'),
      downRule: parseRules('downRule'),
    );
  }

  Exercise toEntity() {
    return switch (trackingType) {
      'duration' => DurationBasedExercise(
        id: id,
        name: name,
        description: description,
        iconUrl: iconUrl,
        fullImageUrl: fullImageUrl,
        requiredLandmarks: requiredLandmarks,
        holdRules: holdRule.map((rule) => rule.toEntity()).toList(),
      ),
      // 'reps', and anything unexpected — fail toward the more common
      // shape rather than throwing on an unrecognized trackingType.
      _ => RepBasedExercise(
        id: id,
        name: name,
        description: description,
        iconUrl: iconUrl,
        fullImageUrl: fullImageUrl,
        requiredLandmarks: requiredLandmarks,
        upRules: upRule.map((rule) => rule.toEntity()).toList(),
        downRules: downRule.map((rule) => rule.toEntity()).toList(),
      ),
    };
  }
}
