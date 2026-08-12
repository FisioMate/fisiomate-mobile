part of '_widgets.dart';

enum DayExerciseStatus { none, scheduled, completed, missed }

/// Monthly calendar — header ("Agustus 2026" + "x/y Selesai"), then a
/// card with a Monday-first day grid colored by [DayExerciseStatus].
/// Scheduling comes from the backend later; for now the caller supplies
/// [statusByDate] directly (dummy data until that's wired up).
class ExerciseCalendarCard extends StatelessWidget {
  final DateTime month;
  final Map<DateTime, DayExerciseStatus> statusByDate;
  final ValueChanged<DateTime>? onCompletedDayTap;

  const ExerciseCalendarCard({
    super.key,
    required this.month,
    required this.statusByDate,
    this.onCompletedDayTap,
  });

  static const _weekdayLabels = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];
  static const _monthNames = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  DayExerciseStatus _statusFor(DateTime date) {
    return statusByDate[DateTime(date.year, date.month, date.day)] ??
        DayExerciseStatus.none;
  }

  /// Monday-first grid covering the full month, padded with leading/
  /// trailing days from adjacent months to fill whole weeks.
  List<DateTime> _buildGridDays() {
    final firstOfMonth = DateTime(month.year, month.month, 1);
    final lastOfMonth = DateTime(month.year, month.month + 1, 0);

    final leadingCount = firstOfMonth.weekday - 1; // DateTime.monday == 1
    final gridStart = firstOfMonth.subtract(Duration(days: leadingCount));
    final totalCells = ((leadingCount + lastOfMonth.day) / 7).ceil() * 7;

    return List.generate(totalCells, (i) => gridStart.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final completed = statusByDate.values
        .where((status) => status == DayExerciseStatus.completed)
        .length;
    final total = statusByDate.values
        .where((status) => status != DayExerciseStatus.none)
        .length;

    final today = DateTime.now();
    final gridDays = _buildGridDays();
    final weeks = <List<DateTime>>[
      for (var i = 0; i < gridDays.length; i += 7) gridDays.sublist(i, i + 7),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_monthNames[month.month - 1]} ${month.year}',
              style: FontTheme.headlineMedium,
            ),
            Text(
              '$completed/$total Selesai',
              style: FontTheme.bodyMedium.copyWith(
                color: BaseColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: BaseColors.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: _weekdayLabels
                    .map(
                      (label) => Expanded(
                        child: Center(
                          child: Text(
                            label,
                            style: FontTheme.labelSmall.copyWith(
                              color: BaseColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8),
              for (final week in weeks)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: week
                        .map(
                          (date) => Expanded(
                            child: _CalendarDayCell(
                              date: date,
                              isCurrentMonth:
                                  date.month == month.month &&
                                  date.year == month.year,
                              isToday: DateUtils.isSameDay(date, today),
                              status: _statusFor(date),
                              onTap:
                                  _statusFor(date) ==
                                      DayExerciseStatus.completed
                                  ? () => onCompletedDayTap?.call(date)
                                  : null,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Text(
            textAlign: TextAlign.right,
            'Klik tanggal yang selesai untuk melihat riwayat sesi',
            style: FontTheme.bodySmall.copyWith(
              color: BaseColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  final DateTime date;
  final bool isCurrentMonth;
  final bool isToday;
  final DayExerciseStatus status;
  final VoidCallback? onTap;

  const _CalendarDayCell({
    required this.date,
    required this.isCurrentMonth,
    required this.isToday,
    required this.status,
    required this.onTap,
  });

  (Color, Color) get _colors {
    if (isToday) return (BaseColors.primary, Colors.white);
    if (!isCurrentMonth) {
      return (Colors.black.withValues(alpha: 0.05), BaseColors.textDisabled);
    }

    return switch (status) {
      DayExerciseStatus.completed => (BaseColors.primary50, BaseColors.primary),
      DayExerciseStatus.scheduled => (Color(0xFFFFF2DE), Color(0xFFAB6904)),
      DayExerciseStatus.missed => (BaseColors.errorLight, BaseColors.error),
      DayExerciseStatus.none => (Colors.transparent, BaseColors.textPrimary),
    };
  }

  @override
  Widget build(BuildContext context) {
    final (background, foreground) = _colors;

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Material(
          color: background,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: Center(
              child: Text(
                '${date.day}',
                style: FontTheme.bodyMedium.copyWith(
                  color: foreground,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
