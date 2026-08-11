part of '_pages.dart';

class ExerciseGuidePage extends StatefulWidget {
  final List<RoutineItem> routineItems;
  final int initialIndex;

  const ExerciseGuidePage({
    super.key,
    required this.routineItems,
    this.initialIndex = 0,
  });

  @override
  State<ExerciseGuidePage> createState() => _ExerciseGuidePageState();
}

class _ExerciseGuidePageState extends State<ExerciseGuidePage> {
  static const _countdownSeconds = 10;

  late final int _index = widget.initialIndex;
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
        // TODO: hand off to the camera tracking screen once that flow
        // exists. UI-only for now.
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _skipCountdown() {
    _timer?.cancel();
    setState(() => _remainingSeconds = 0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.routineItems[_index];
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
                  Text(
                    'Gerakan ${_index + 1} dari ${widget.routineItems.length}',
                    style: FontTheme.bodySmall.copyWith(
                      color: BaseColors.textSecondary,
                    ),
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
