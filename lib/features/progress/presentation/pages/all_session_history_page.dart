part of '_pages.dart';

class AllSessionHistoryPage extends StatefulWidget {
  const AllSessionHistoryPage({super.key});

  @override
  State<AllSessionHistoryPage> createState() => _AllSessionHistoryPageState();
}

class _AllSessionHistoryPageState extends State<AllSessionHistoryPage> {
  SessionFilter _filter = SessionFilter.all;
  String _query = '';

  List<SessionLog> get _filteredSessions {
    final now = DateTime.now();
    var sessions = [..._dummySessionLogs]..sort(
      (a, b) => b.date.compareTo(a.date),
    );

    sessions = switch (_filter) {
      SessionFilter.all => sessions,
      SessionFilter.thisWeek => sessions
          .where((session) => now.difference(session.date).inDays <= 7)
          .toList(),
      SessionFilter.thisMonth => sessions
          .where(
            (session) =>
                session.date.year == now.year &&
                session.date.month == now.month,
          )
          .toList(),
    };

    if (_query.isNotEmpty) {
      sessions = sessions
          .where(
            (session) => formatIndonesianDate(
              session.date,
            ).toLowerCase().contains(_query.toLowerCase()),
          )
          .toList();
    }

    return sessions;
  }

  @override
  Widget build(BuildContext context) {
    final sessions = _filteredSessions;

    return Scaffold(
      appBar: MainAppBar(label: 'Semua Riwayat Sesi', showNotification: true),
      body: Padding(
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
              PillSelector<SessionFilter>(
                options: SessionFilter.values,
                selected: _filter,
                labelBuilder: (filter) => filter.label,
                onChanged: (filter) => setState(() => _filter = filter),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: sessions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) => SessionLogCard(
                    key: ValueKey(sessions[index].id),
                    session: sessions[index],
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
