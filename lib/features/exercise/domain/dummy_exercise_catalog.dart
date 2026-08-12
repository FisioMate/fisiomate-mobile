import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';

// TODO: replace with real data once ExerciseRepository/GET /catalog is
// wired up. Angle names below must match keys in
// `core/utils/angle_catalog.dart` — that's what `computeAllCatalogAngles`
// keys its output by.
//
// Thresholds for squat/push-up/plank/shoulder-raise are ported from the
// pose-detection-demo spike (lib/features/pose/domain/exercise_catalog.dart),
// which itself flags them as rough estimates from generic reference
// tables, not yet calibrated through on-device testing.
// standing-leg-swing has no such reference — thresholds there are a
// rough first guess of ours, even less trustworthy. Validate all of
// these before trusting rep/hold counts.
const List<Exercise> dummyExerciseCatalog = [
  RepBasedExercise(
    id: 'squat',
    name: 'Squat',
    description:
        'Berdiri tegak, kaki selebar bahu, tekuk lutut perlahan hingga '
        '90°, lalu diri kembali ke posisi awal.',
    iconUrl:
        'https://minio.jocimsus.tech/lefi-calon-presiden-ristek/catalog/ccdfbdcf-1b83-48fb-a1fa-9a8b86d2cf3d.png',
    fullImageUrl:
        'https://minio.jocimsus.tech/lefi-calon-presiden-ristek/catalog/cbd956e1-8f34-4dab-9c0c-e5c2415de4ad.jpg',
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
    description:
        'Posisi badan lurus dari bahu hingga tumit, tekuk siku hingga '
        'dada mendekati lantai, lalu dorong kembali ke posisi awal.',
    iconUrl: 'https://placehold.co/96x96/008372/FFFFFF?text=Push-up',
    fullImageUrl: 'https://placehold.co/600x400/EAFCF7/006F5E?text=Push-up',
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
    description:
        'Topang tubuh dengan lengan bawah dan ujung kaki, jaga tubuh '
        'tetap lurus dari bahu hingga tumit selama waktu yang ditentukan.',
    iconUrl: 'https://placehold.co/96x96/008372/FFFFFF?text=Plank',
    fullImageUrl: 'https://placehold.co/600x400/EAFCF7/006F5E?text=Plank',
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
    id: 'arm-raise',
    name: 'Lateral Arm Raise',
    description:
        'Berdiri tegak, angkat kedua lengan ke samping hingga sejajar '
        'bahu, luruskan siku, lalu tahan pada posisi tersebut.',
    iconUrl:
        'https://minio.jocimsus.tech/lefi-calon-presiden-ristek/catalog/333f336f-7380-4c7c-a52d-259b31b1a8af.png',
    fullImageUrl:
        'https://minio.jocimsus.tech/lefi-calon-presiden-ristek/catalog/e5b47a02-c4a9-43d1-a555-45378d68d6f8.jpg',
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
  // No reference implementation for this one (unlike the four above) —
  // thresholds are our own rough first guess, treat as even less
  // trustworthy until validated on-device.
  RepBasedExercise(
    id: 'standing-leg-swing',
    name: 'Standing Leg Swing',
    description:
        'Berdiri tegak berpegangan pada kursi/dinding bila perlu, ayunkan '
        'tungkai kanan ke depan lalu kembali ke posisi netral.',
    iconUrl:
        'https://minio.jocimsus.tech/lefi-calon-presiden-ristek/catalog/82b7337b-53ff-4d3b-a140-a61b1b4de11b.png',
    fullImageUrl:
        'https://minio.jocimsus.tech/lefi-calon-presiden-ristek/catalog/81190ef5-bbab-4945-8062-1dcfed9f4cdc.jpg',
    requiredLandmarks: ['rightShoulder', 'rightHip', 'rightKnee'],
    upRules: [
      AngleRule(
        angleName: 'rightHip',
        minAngle: 100,
        maxAngle: 140,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Jangan mengayun terlalu tinggi',
        aboveMaxMessage: 'Ayunkan tungkai kanan lebih tinggi',
      ),
    ],
    downRules: [
      AngleRule(
        angleName: 'rightHip',
        minAngle: 160,
        maxAngle: 180,
        missingMessage: 'Posisikan diri Anda dalam bingkai kamera',
        belowMinMessage: 'Kembalikan tungkai ke posisi netral',
        aboveMaxMessage: 'Jangan mengunci pinggul secara berlebihan',
      ),
    ],
  ),
];
