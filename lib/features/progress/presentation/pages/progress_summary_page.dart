part of '_pages.dart';

enum ProgressRange { all, monthly, weekly }

extension on ProgressRange {
  String get label => switch (this) {
    ProgressRange.all => 'Semua',
    ProgressRange.monthly => 'Bulanan',
    ProgressRange.weekly => 'Mingguan',
  };

  String get complianceLabel => switch (this) {
    ProgressRange.all => 'Kepatuhan',
    ProgressRange.monthly => 'Kepatuhan Bulanan',
    ProgressRange.weekly => 'Kepatuhan Mingguan',
  };
}

class ProgressSummaryPage extends StatefulWidget {
  const ProgressSummaryPage({super.key});

  @override
  State<ProgressSummaryPage> createState() => _ProgressSummaryPageState();
}

class _ProgressSummaryPageState extends State<ProgressSummaryPage> {
  ProgressRange _range = ProgressRange.monthly;
  String _query = '';

  List<SessionLog> get _recentSessions {
    final sorted = [...dummySessionLogs]
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

  ProgressStats _statsFor(ProgressRange range) => switch (range) {
    ProgressRange.all => computeAllTimeProgressStats(dummySessionLogs),
    ProgressRange.monthly => computeMonthlyProgressStats(dummySessionLogs),
    ProgressRange.weekly => computeWeeklyProgressStats(dummySessionLogs),
  };

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
