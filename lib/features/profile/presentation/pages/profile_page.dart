part of '_pages.dart';

// ! Demo: profile page placeholder interface
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String _name = 'Zika';
  static const String _email = 'zidane@example.com';
  static const String _role = 'Pasien Fisioterapi';
  static const String _physiotherapistName = 'dr. Budi Santoso, Sp.KFR';

  static const List<({IconData icon, String label})> _menuItems = [
    (icon: Icons.person_outline, label: 'Edit Profil'),
    (icon: Icons.notifications_outlined, label: 'Notifikasi'),
    (icon: Icons.language_outlined, label: 'Bahasa'),
    (icon: Icons.help_outline, label: 'Bantuan & Dukungan'),
    (icon: Icons.info_outline, label: 'Tentang Aplikasi'),
  ];

  @override
  Widget build(BuildContext context) {
    final stats = computeAllTimeProgressStats(dummySessionLogs);
    final streak = computeCurrentStreak(dummySessionLogs);

    return Scaffold(
      appBar: MainAppBar(label: 'Profil', showNotification: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_name, style: FontTheme.headlineMedium),
                        const SizedBox(height: 2),
                        Text(
                          _role,
                          style: FontTheme.bodyMedium.copyWith(
                            color: BaseColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _email,
                          style: FontTheme.bodySmall.copyWith(
                            color: BaseColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
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
                    child: StatTile(value: '$streak', label: 'Hari Beruntun'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: BaseColors.primary50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: BaseColors.primary100,
                      child: Icon(
                        Icons.medical_services_outlined,
                        color: BaseColors.primary700,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fisioterapis Anda',
                            style: FontTheme.bodySmall.copyWith(
                              color: BaseColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _physiotherapistName,
                            style: FontTheme.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Pengaturan', style: FontTheme.headlineMedium),
              const SizedBox(height: 12),
              for (final item in _menuItems) ...[
                _ProfileMenuTile(icon: item.icon, label: item.label),
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Fisiomate Demo • v0.1.0',
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
