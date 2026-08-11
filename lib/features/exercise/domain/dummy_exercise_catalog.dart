import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';

// TODO: replace with real data once ExerciseRepository/GET /catalog is
// wired up. Angle names below must match keys in
// `core/utils/angle_catalog.dart` — that's what `computeAllCatalogAngles`
// keys its output by.
//
// Thresholds are ported from the pose-detection-demo spike
// (lib/features/pose/domain/exercise_catalog.dart), which itself flags
// them as rough estimates from generic reference tables, not yet
// calibrated through on-device testing. Validate before trusting counts.
const List<Exercise> dummyExerciseCatalog = [
  RepBasedExercise(
    id: 'squat',
    name: 'Squat',
    requiredLandmarks: [
      'leftHip',
      'leftKnee',
      'leftAnkle',
      'rightHip',
      'rightKnee',
      'rightAnkle',
    ],
    upRules: [
      AngleRule(
        angleName: 'leftKnee',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Berdiri lebih tegak',
        aboveMaxMessage: 'Jangan mengunci lutut kiri secara berlebihan',
      ),
      AngleRule(
        angleName: 'rightKnee',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Berdiri lebih tegak',
        aboveMaxMessage: 'Jangan mengunci lutut kanan secara berlebihan',
      ),
    ],
    downRules: [
      AngleRule(
        angleName: 'leftKnee',
        minAngle: 60,
        maxAngle: 100,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Jangan turun terlalu dalam',
        aboveMaxMessage: 'Turunkan tubuh Anda lebih dalam',
      ),
      AngleRule(
        angleName: 'rightKnee',
        minAngle: 60,
        maxAngle: 100,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Jangan turun terlalu dalam',
        aboveMaxMessage: 'Turunkan tubuh Anda lebih dalam',
      ),
    ],
  ),
  RepBasedExercise(
    id: 'push-up',
    name: 'Push-up',
    requiredLandmarks: [
      'leftShoulder',
      'leftElbow',
      'leftWrist',
      'leftHip',
      'leftAnkle',
      'rightShoulder',
      'rightElbow',
      'rightWrist',
      'rightHip',
      'rightAnkle',
    ],
    // Back-straightness checked first in both phases — form/injury-risk
    // feedback outranks the rep-phase prompt.
    upRules: [
      AngleRule(
        angleName: 'leftBody',
        minAngle: 150,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan punggung Anda',
        aboveMaxMessage: 'Luruskan punggung Anda',
      ),
      AngleRule(
        angleName: 'rightBody',
        minAngle: 150,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan punggung Anda',
        aboveMaxMessage: 'Luruskan punggung Anda',
      ),
      AngleRule(
        angleName: 'leftElbow',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan lengan Anda sepenuhnya',
        aboveMaxMessage: 'Jangan mengunci siku secara berlebihan',
      ),
      AngleRule(
        angleName: 'rightElbow',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan lengan Anda sepenuhnya',
        aboveMaxMessage: 'Jangan mengunci siku secara berlebihan',
      ),
    ],
    downRules: [
      AngleRule(
        angleName: 'leftBody',
        minAngle: 150,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan punggung Anda',
        aboveMaxMessage: 'Luruskan punggung Anda',
      ),
      AngleRule(
        angleName: 'rightBody',
        minAngle: 150,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan punggung Anda',
        aboveMaxMessage: 'Luruskan punggung Anda',
      ),
      AngleRule(
        angleName: 'leftElbow',
        minAngle: 60,
        maxAngle: 100,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Jangan turun terlalu dalam',
        aboveMaxMessage: 'Turunkan dada Anda lebih dekat ke lantai',
      ),
      AngleRule(
        angleName: 'rightElbow',
        minAngle: 60,
        maxAngle: 100,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Jangan turun terlalu dalam',
        aboveMaxMessage: 'Turunkan dada Anda lebih dekat ke lantai',
      ),
    ],
  ),
  DurationBasedExercise(
    id: 'plank',
    name: 'Plank',
    requiredLandmarks: [
      'leftShoulder',
      'leftHip',
      'leftAnkle',
      'rightShoulder',
      'rightHip',
      'rightAnkle',
    ],
    holdRules: [
      AngleRule(
        angleName: 'leftBody',
        minAngle: 150,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan tubuh Anda',
        aboveMaxMessage: 'Luruskan tubuh Anda',
      ),
      AngleRule(
        angleName: 'rightBody',
        minAngle: 150,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Luruskan tubuh Anda',
        aboveMaxMessage: 'Luruskan tubuh Anda',
      ),
    ],
  ),
  DurationBasedExercise(
    id: 'shoulder-raise',
    name: 'Shoulder Raise',
    requiredLandmarks: [
      'leftHip',
      'leftShoulder',
      'leftElbow',
      'leftWrist',
      'rightHip',
      'rightShoulder',
      'rightElbow',
      'rightWrist',
    ],
    holdRules: [
      AngleRule(
        angleName: 'leftShoulder',
        minAngle: 70,
        maxAngle: 110,
        missingMessage: 'Bahu kiri tidak terdeteksi',
        belowMinMessage: 'Angkat lengan kiri lebih tinggi',
        aboveMaxMessage: 'Lengan kiri terlalu tinggi, turunkan sedikit',
      ),
      AngleRule(
        angleName: 'rightShoulder',
        minAngle: 70,
        maxAngle: 110,
        missingMessage: 'Bahu kanan tidak terdeteksi',
        belowMinMessage: 'Angkat lengan kanan lebih tinggi',
        aboveMaxMessage: 'Lengan kanan terlalu tinggi, turunkan sedikit',
      ),
      AngleRule(
        angleName: 'leftElbow',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Siku kiri tidak terdeteksi',
        belowMinMessage: 'Luruskan siku kiri',
        aboveMaxMessage: 'Jangan mengunci siku kiri secara berlebihan',
      ),
      AngleRule(
        angleName: 'rightElbow',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Siku kanan tidak terdeteksi',
        belowMinMessage: 'Luruskan siku kanan',
        aboveMaxMessage: 'Jangan mengunci siku kanan secara berlebihan',
      ),
    ],
  ),
];
