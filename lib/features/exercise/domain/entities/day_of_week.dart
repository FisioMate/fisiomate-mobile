/// Mirrors the backend's `DayOfWeek` — used on [RoutineItem.days] to mark
/// which days of the week a routine item is scheduled for.
enum DayOfWeek {
  senin,
  selasa,
  rabu,
  kamis,
  jumat,
  sabtu,
  minggu;

  /// [DateTime.weekday] is already 1 (Monday) .. 7 (Sunday), lining up
  /// 1:1 with this enum's declaration order.
  static DayOfWeek fromDate(DateTime date) => values[date.weekday - 1];
}
