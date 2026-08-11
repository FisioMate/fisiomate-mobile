import 'dart:async';

import 'package:camera/camera.dart';
import 'package:fisiomate/core/themes/base_colors.dart';
import 'package:fisiomate/core/themes/font_theme.dart';
import 'package:fisiomate/core/utils/angle_calculator.dart';
import 'package:fisiomate/core/widgets/_widgets.dart';
import 'package:fisiomate/features/exercise/domain/duration_based_tracker.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';
import 'package:fisiomate/features/exercise/domain/entities/pose_validation_state.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';
import 'package:fisiomate/features/exercise/domain/exercise_session_progress.dart';
import 'package:fisiomate/features/exercise/domain/rep_based_tracker.dart';
import 'package:fisiomate/features/exercise/domain/routine_duration_estimator.dart';
import 'package:fisiomate/features/exercise/presentation/widgets/_widgets.dart';
import 'package:fisiomate/services/pose_detection_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

part 'exercise_flow_args.dart';
part 'pre_exercise_page.dart';
part 'exercise_guide_page.dart';
part 'camera_view_page.dart';
part 'exercise_result_page.dart';
