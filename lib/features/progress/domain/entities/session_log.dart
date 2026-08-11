enum SessionLogStatus { completed, missed }

class SessionLog {
  final String id;
  final DateTime date;
  final DateTime? completedAt;
  final int exerciseCount;
  final double? accuracy;
  final SessionLogStatus status;

  const SessionLog({
    required this.id,
    required this.date,
    this.completedAt,
    required this.exerciseCount,
    this.accuracy,
    required this.status,
  });
}
