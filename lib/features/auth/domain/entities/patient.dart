class Patient {
  final String id;
  final String name;
  final String? profileImageUrl;
  final String userId;
  final String? physiotherapistId;
  final String? connectionCode;

  const Patient({
    required this.id,
    required this.name,
    this.profileImageUrl,
    required this.userId,
    this.physiotherapistId,
    this.connectionCode,
  });

  bool get isConnectedToPhysiotherapist => physiotherapistId != null;
}
