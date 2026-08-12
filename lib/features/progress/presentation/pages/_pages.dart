import 'package:fisiomate/core/themes/base_colors.dart';
import 'package:fisiomate/core/themes/font_theme.dart';
import 'package:fisiomate/core/utils/date_formatter.dart';
import 'package:fisiomate/core/widgets/_widgets.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';
import 'package:fisiomate/features/exercise/presentation/cubit/_cubits.dart';
import 'package:fisiomate/features/progress/domain/entities/session_log.dart';
import 'package:fisiomate/features/progress/domain/progress_stats.dart';
import 'package:fisiomate/features/progress/domain/session_log_builder.dart';
import 'package:fisiomate/features/progress/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'progress_summary_page.dart';
part 'all_session_history_page.dart';
