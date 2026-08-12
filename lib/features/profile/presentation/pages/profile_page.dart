part of '_pages.dart';

// TODO: UI design belum final — layout placeholder. Menu di bawah
// (Edit Profil, Notifikasi, dll) belum ada fungsi apa pun.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String _role = 'Pasien Fisioterapi';

  static const List<({IconData icon, String label})> _menuItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(label: 'Profil', showNotification: true),
      body: BlocBuilder<CurrentPatientCubit, CurrentPatientState>(
        builder: (context, state) {
          final patient = switch (state) {
            CurrentPatientLoaded(:final patient) => patient,
            _ => null,
          };

          return RefreshIndicator(
            onRefresh: () => Future.wait([
              context.read<CurrentPatientCubit>().fetch(),
              context.read<RoutineItemsCubit>().fetch(),
            ]),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfileHeader(patient: patient),
                    const SizedBox(height: 24),
                    BlocBuilder<RoutineItemsCubit, RoutineItemsState>(
                      builder: (context, state) {
                        final items = switch (state) {
                          RoutineItemsLoaded(:final items) => items,
                          _ => const <RoutineItem>[],
                        };
                        final sessions = buildSessionLogs(items);
                        final stats = computeAllTimeProgressStats(sessions);
                        final streak = computeCurrentStreak(sessions);

                        return Row(
                          children: [
                            Expanded(
                              child: StatTile(
                                value: '${stats.completed}',
                                label: 'Sesi Selesai',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: StatTile(
                                value: '${stats.averageAccuracy.round()}%',
                                label: 'Rata-rata Akurasi',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: StatTile(
                                value: '$streak',
                                label: 'Hari Beruntun',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    _PhysiotherapistConnectionCard(patient: patient),
                    const SizedBox(height: 24),
                    Text('Pengaturan', style: FontTheme.headlineMedium),
                    const SizedBox(height: 12),
                    for (final item in _menuItems) ...[
                      _ProfileMenuTile(icon: item.icon, label: item.label),
                      const SizedBox(height: 8),
                    ],
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: MainButton(
                        label: 'Logout',
                        variant: ButtonVariant.error,
                        styleType: ButtonStyleType.outlined,
                        onPressed: () async {
                          await context.read<AuthRepository>().logout();
                          if (context.mounted) context.go('/auth');
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Fisiomate • v0.1.0',
                        style: FontTheme.bodySmall.copyWith(
                          color: BaseColors.textDisabled,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final Patient? patient;

  const _ProfileHeader({required this.patient});

  @override
  Widget build(BuildContext context) {
    final name = patient?.name ?? 'Pasien';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: BaseColors.primary,
            backgroundImage: patient?.profileImageUrl != null
                ? NetworkImage(patient!.profileImageUrl!)
                : null,
            child: patient?.profileImageUrl == null
                ? Text(
                    initial,
                    style: FontTheme.headlineLarge.copyWith(
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: FontTheme.headlineMedium),
              const SizedBox(height: 2),
              Text(
                ProfilePage._role,
                style: FontTheme.bodyMedium.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PhysiotherapistConnectionCard extends StatelessWidget {
  final Patient? patient;

  const _PhysiotherapistConnectionCard({required this.patient});

  @override
  Widget build(BuildContext context) {
    final isConnected = patient?.isConnectedToPhysiotherapist ?? false;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isConnected ? BaseColors.primary50 : BaseColors.border,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: isConnected
                ? BaseColors.primary100
                : BaseColors.surface,
            child: Icon(
              Icons.medical_services_outlined,
              color: isConnected
                  ? BaseColors.primary700
                  : BaseColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status',
                  style: FontTheme.bodySmall.copyWith(
                    color: BaseColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isConnected
                      ? 'Terhubung dengan fisioterapis'
                      : 'Belum terhubung dengan fisioterapis',
                  style: FontTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (!isConnected)
            TextButton(
              onPressed: () => context.push('/connect'),
              child: const Text('Hubungkan'),
            ),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileMenuTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: BaseColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BaseColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: BaseColors.textSecondary, size: 22),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: FontTheme.bodyMedium)),
          Icon(Icons.chevron_right, color: BaseColors.textSecondary),
        ],
      ),
    );
  }
}
