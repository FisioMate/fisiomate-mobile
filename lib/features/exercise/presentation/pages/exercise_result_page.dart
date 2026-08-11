part of '_pages.dart';

class ExerciseResultPage extends StatelessWidget {
  final ExerciseSessionProgress session;

  const ExerciseResultPage({super.key, required this.session});

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
                      value: "${session.totalActiveMinutes}'",
                      label: 'Total waktu (menit) pelaksanaan aktif',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatTile(
                      value: '${session.accuracyPercent.round()}%',
                      label: 'Skor Akurasi Gerakan Keseluruhan',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  label: 'Kirim Sesi & Selesai',
                  // TODO: wire to a session-submission endpoint once the
                  // backend exposes one (not in openapi.json yet) —
                  // returns to home for now.
                  onPressed: () => context.go('/'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
