part of '_pages.dart';

class ExerciseResultPage extends StatefulWidget {
  final ExerciseSessionProgress session;

  const ExerciseResultPage({super.key, required this.session});

  @override
  State<ExerciseResultPage> createState() => _ExerciseResultPageState();
}

class _ExerciseResultPageState extends State<ExerciseResultPage> {
  bool _isSubmitting = false;

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);
    final repository = context.read<ExerciseRepository>();
    try {
      // One log per exercise — the backend tracks logs per exercise, not
      // per whole-routine session (see ExerciseSessionProgress).
      for (final summary in widget.session.perExerciseSummaries) {
        await repository.completeExerciseSession(
          exerciseId: summary.exerciseId,
          activeDuration: summary.activeDuration,
          accuracyScore: summary.accuracyPercent,
        );
      }
      if (mounted) context.go('/');
    } on Failure catch (failure) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(failure.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(label: 'Hasil Latihan', showNotification: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Text(
                'Sesi latihan Anda telah selesai!',
                textAlign: TextAlign.center,
                style: FontTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tetap semangat dan konsisten untuk sesi latihan di hari '
                'kedepannya',
                textAlign: TextAlign.center,
                style: FontTheme.bodyMedium.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: StatTile(
                      value: "${widget.session.totalActiveMinutes}'",
                      label: 'Total waktu (menit) pelaksanaan aktif',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatTile(
                      value: '${widget.session.accuracyPercent.round()}%',
                      label: 'Skor Akurasi Gerakan Keseluruhan',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  label: _isSubmitting ? 'Mengirim...' : 'Kirim Sesi & Selesai',
                  onPressed: _isSubmitting ? null : _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
