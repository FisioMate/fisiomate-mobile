part of '_pages.dart';

class ProgressSummaryPage extends StatefulWidget {
  const ProgressSummaryPage({super.key});

  @override
  State<ProgressSummaryPage> createState() => _ProgressSummaryPageState();
}

class _ProgressSummaryPageState extends State<ProgressSummaryPage> {
  ProgressRange _range = ProgressRange.monthly;
  String _query = '';

  List<SessionLog> get _recentSessions {
    final sorted = [..._dummySessionLogs]
      ..sort((a, b) => b.date.compareTo(a.date));
    final filtered = _query.isEmpty
        ? sorted
        : sorted
              .where(
                (session) => formatIndonesianDate(
                  session.date,
                ).toLowerCase().contains(_query.toLowerCase()),
              )
              .toList();
    return filtered.take(4).toList();
  }

  ({
    double compliancePercent,
    int completed,
    int total,
    List<double> accuracyTrend,
  })
  _statsFor(ProgressRange range) {
    final now = DateTime.now();
    final sessions = switch (range) {
      ProgressRange.all => _dummySessionLogs,
      ProgressRange.monthly => _dummySessionLogs.where(
        (session) =>
            session.date.year == now.year && session.date.month == now.month,
      ),
      ProgressRange.weekly => _dummySessionLogs.where(
        (session) => now.difference(session.date).inDays <= 7,
      ),
    }.toList()..sort((a, b) => a.date.compareTo(b.date));

    final completed = sessions
        .where((session) => session.status == SessionLogStatus.completed)
        .length;
    final total = sessions.length;
    final accuracyTrend = sessions
        .where((session) => session.accuracy != null)
        .map((session) => session.accuracy!)
        .toList();

    return (
      compliancePercent: total == 0 ? 0 : (completed / total) * 100,
      completed: completed,
      total: total,
      accuracyTrend: accuracyTrend,
    );
  }

  @override
  Widget build(BuildContext context) {
    final stats = _statsFor(_range);

    return Scaffold(
      appBar: MainAppBar(label: 'Progress Saya', showNotification: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(
                hintText: 'Cari Riwayat Progress',
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 16),
              PillSelector<ProgressRange>(
                options: ProgressRange.values,
                selected: _range,
                labelBuilder: (range) => range.label,
                onChanged: (range) => setState(() => _range = range),
              ),
              const SizedBox(height: 20),
              ComplianceCard(
                percent: stats.compliancePercent,
                label: _range.complianceLabel,
                completed: stats.completed,
                total: stats.total,
              ),
              const SizedBox(height: 32),
              Text('Tren Akurasi Gerakan', style: FontTheme.headlineMedium),
              const SizedBox(height: 16),
              AccuracyLineChart(data: stats.accuracyTrend),
              const SizedBox(height: 32),
              Text('Riwayat Sesi', style: FontTheme.headlineMedium),
              const SizedBox(height: 16),
              for (final session in _recentSessions) ...[
                SessionLogCard(key: ValueKey(session.id), session: session),
                const SizedBox(height: 12),
              ],
              Center(
                child: TextButton(
                  onPressed: () => context.push('/progress/history'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lihat Semua',
                        style: FontTheme.bodyMedium.copyWith(
                          color: BaseColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.chevron_right,
                        color: BaseColors.textSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
