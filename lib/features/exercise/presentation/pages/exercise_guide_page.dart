part of '_pages.dart';

class ExerciseGuidePage extends StatefulWidget {
  final ExerciseFlowArgs args;

  const ExerciseGuidePage({super.key, required this.args});

  @override
  State<ExerciseGuidePage> createState() => _ExerciseGuidePageState();
}

class _ExerciseGuidePageState extends State<ExerciseGuidePage> {
  static const _countdownSeconds = 10;

  int _remainingSeconds = _countdownSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() => _remainingSeconds = 0);
        _startTracking();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _skipCountdown() {
    _timer?.cancel();
    setState(() => _remainingSeconds = 0);
    _startTracking();
  }

  void _startTracking() {
    if (!mounted) return;
    context.pushReplacement('/exercise/camera', extra: widget.args);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.args.item;
    final exercise = item.exercise;
    final isRepBased = exercise is RepBasedExercise;

    return Scaffold(
      appBar: MainAppBar(label: 'Panduan Gerakan'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(exercise.name, style: FontTheme.headlineLarge),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Gerakan ${widget.args.itemIndex + 1} dari ${widget.args.routineItems.length}',
                        style: FontTheme.bodySmall.copyWith(
                          color: BaseColors.textSecondary,
                        ),
                      ),
                      Text(
                        'Set ${widget.args.currentSet} dari ${item.sets}',
                        style: FontTheme.bodySmall.copyWith(
                          color: BaseColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  exercise.fullImageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 200,
                    color: BaseColors.border,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: BaseColors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Panduan Gerakan',
                style: FontTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                exercise.description,
                style: FontTheme.bodyMedium.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: StatTile(
                      value: isRepBased
                          ? '${item.targetRepsOrSeconds}X'
                          : '${item.targetRepsOrSeconds} Detik',
                      label: isRepBased ? 'Repetisi' : 'Durasi',
                      color: BaseColors.error,
                      backgroundColor: BaseColors.errorLight,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatTile(
                      value: '${item.sets}',
                      label: 'Set',
                      color: BaseColors.error,
                      backgroundColor: BaseColors.errorLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'Bersiap di depan Kamera',
                  style: FontTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: CircularProgress(
                  value: _remainingSeconds / _countdownSeconds,
                  size: 80,
                  strokeWidth: 10,
                  child: Text(
                    '$_remainingSeconds',
                    style: FontTheme.headlineLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: BaseColors.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: Text("Detik", textAlign: TextAlign.center),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  label: 'Lewati Hitung Mundur',
                  onPressed: _remainingSeconds > 0 ? _skipCountdown : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
