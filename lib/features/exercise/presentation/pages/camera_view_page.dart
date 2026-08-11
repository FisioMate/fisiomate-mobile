part of '_pages.dart';

/// Real-time camera + pose-tracking screen for one set of one exercise.
/// On completion (target reps reached / hold duration met), commits this
/// set's valid/total time into [ExerciseFlowArgs.session] and advances:
/// next set of the same exercise -> next exercise's guide/countdown ->
/// or, once the whole routine is done, [ExerciseResultPage].
class CameraViewPage extends StatefulWidget {
  final ExerciseFlowArgs args;

  const CameraViewPage({super.key, required this.args});

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  final PoseDetectionService _poseDetectionService = PoseDetectionService();
  StreamSubscription<Pose?>? _poseSubscription;

  RepBasedTracker? _repTracker;
  DurationBasedTracker? _durationTracker;

  Pose? _pose;
  Map<String, double?> _computedAngles = const {};
  Size _imageSize = Size.zero;
  DateTime? _lastFrameTime;
  bool _cameraReady = false;
  bool _hasFinished = false;
  bool _committedToSession = false;

  RoutineItem get _item => widget.args.item;

  @override
  void initState() {
    super.initState();
    final exercise = _item.exercise;
    if (exercise is RepBasedExercise) {
      _repTracker = RepBasedTracker(exercise);
    } else if (exercise is DurationBasedExercise) {
      _durationTracker = DurationBasedTracker(
        exercise,
        _item.targetRepsOrSeconds,
      );
    }
    _initCamera();
  }

  Future<void> _initCamera() async {
    // Front camera — the patient needs to see themselves while tracking.
    await _poseDetectionService.initialize(
      lensDirection: CameraLensDirection.front,
    );
    if (!mounted) return;
    setState(() => _cameraReady = true);
    _poseSubscription = _poseDetectionService.poseStream.listen(_onPose);
  }

  void _onPose(Pose? pose) {
    if (_hasFinished) return;

    if (pose == null) {
      if (mounted) setState(() => _pose = null);
      return;
    }

    final now = DateTime.now();
    final elapsed = _lastFrameTime == null
        ? Duration.zero
        : now.difference(_lastFrameTime!);
    _lastFrameTime = now;

    final angles = computeAllCatalogAngles(pose.landmarks);
    _repTracker?.processFrame(angles, elapsed);
    _durationTracker?.processFrame(angles, elapsed);

    final previewSize = _poseDetectionService.controller?.value.previewSize;

    if (mounted) {
      setState(() {
        _pose = pose;
        _computedAngles = angles;
        if (previewSize != null) {
          // Camera frames arrive in landscape orientation regardless of
          // device orientation, so width/height are swapped to match the
          // portrait preview shown on screen.
          _imageSize = Size(previewSize.height, previewSize.width);
        }
      });
    }

    _maybeFinishSet();
  }

  bool get _isSetComplete {
    if (_repTracker != null) {
      return _repTracker!.repCount >= _item.targetRepsOrSeconds;
    }
    if (_durationTracker != null) return _durationTracker!.isComplete;
    return false;
  }

  void _maybeFinishSet() {
    if (_hasFinished || !_isSetComplete) return;
    _hasFinished = true;
    _commitToSession();
    _advance();
  }

  void _commitToSession() {
    if (_committedToSession) return;
    _committedToSession = true;
    final totalTime =
        _repTracker?.totalTime ?? _durationTracker?.totalTime ?? Duration.zero;
    final validTime =
        _repTracker?.validTime ?? _durationTracker?.validTime ?? Duration.zero;
    widget.args.session.addFrame(totalTime, validTime);
  }

  void _advance() {
    if (!mounted) return;
    final args = widget.args;
    final isLastSetOfExercise = args.currentSet >= _item.sets;
    final isLastExercise = args.itemIndex >= args.routineItems.length - 1;

    if (!isLastSetOfExercise) {
      context.pushReplacement(
        '/exercise/guide',
        extra: ExerciseFlowArgs(
          routineItems: args.routineItems,
          itemIndex: args.itemIndex,
          currentSet: args.currentSet + 1,
          session: args.session,
        ),
      );
    } else if (!isLastExercise) {
      context.pushReplacement(
        '/exercise/guide',
        extra: ExerciseFlowArgs(
          routineItems: args.routineItems,
          itemIndex: args.itemIndex + 1,
          currentSet: 1,
          session: args.session,
        ),
      );
    } else {
      context.pushReplacement('/exercise/result', extra: args.session);
    }
  }

  @override
  void dispose() {
    _commitToSession();
    _poseSubscription?.cancel();
    _poseDetectionService.dispose();
    super.dispose();
  }

  PoseValidationState get _state =>
      _repTracker?.state ?? _durationTracker?.state ?? PoseValidationState.tidakValid;

  String? get _feedback => _repTracker?.feedback ?? _durationTracker?.feedback;

  String get _progressLabel {
    if (_repTracker != null) {
      return '${_repTracker!.repCount}/${_item.targetRepsOrSeconds} rep';
    }
    final heldSeconds = _durationTracker!.heldDuration.inSeconds;
    return '$heldSeconds/${_item.targetRepsOrSeconds} detik';
  }

  double get _progress {
    if (_repTracker != null) {
      return (_repTracker!.repCount / _item.targetRepsOrSeconds).clamp(
        0.0,
        1.0,
      );
    }
    return (_durationTracker!.heldDuration.inMilliseconds /
            (_item.targetRepsOrSeconds * 1000))
        .clamp(0.0, 1.0);
  }

  List<String> get _relevantAngleNames {
    final exercise = _item.exercise;
    return {
      if (exercise is RepBasedExercise) ...exercise.upRules.map(
        (r) => r.angleName,
      ),
      if (exercise is RepBasedExercise) ...exercise.downRules.map(
        (r) => r.angleName,
      ),
      if (exercise is DurationBasedExercise) ...exercise.holdRules.map(
        (r) => r.angleName,
      ),
    }.toList();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = _item.exercise;
    final feedback = _feedback;

    return Scaffold(
      appBar: MainAppBar(label: 'Pantau Gerakan'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(color: Colors.black),
                      if (_cameraReady &&
                          _poseDetectionService.controller != null)
                        CameraPreview(_poseDetectionService.controller!),
                      if (_pose != null && _imageSize != Size.zero)
                        CustomPaint(
                          painter: PosePainter(
                            pose: _pose!,
                            imageSize: _imageSize,
                            sensorOrientation: _poseDetectionService
                                .controller!
                                .description
                                .sensorOrientation,
                            computedAngles: _computedAngles,
                            relevantAngleNames: _relevantAngleNames,
                          ),
                        ),
                      Positioned(
                        top: 12,
                        left: 0,
                        right: 0,
                        child: Center(child: PoseStateBadge(state: _state)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_state == PoseValidationState.tidakValid &&
                  feedback != null) ...[
                PoseFeedbackMessage(message: feedback),
                const SizedBox(height: 16),
              ],
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: _progress,
                  minHeight: 8,
                  backgroundColor: BaseColors.secondary50,
                  valueColor: AlwaysStoppedAnimation(BaseColors.secondary),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _progressLabel,
                    style: FontTheme.headlineLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: BaseColors.border,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Set ${widget.args.currentSet}/${_item.sets}',
                      style: FontTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                exercise.name,
                style: FontTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Gerakan ${widget.args.itemIndex + 1} dari ${widget.args.routineItems.length}',
                style: FontTheme.bodySmall.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                exercise.description,
                style: FontTheme.bodyMedium.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
