/// API path catalog, mirrored from `local/backend/openapi.json`.
///
/// Paths are relative — [Client] supplies [Config.apiBaseUrl] as the
/// Dio `baseUrl`, so these just get appended to it.
abstract final class EndPoints {
  // Auth
  static const String login = '/api/v1/auth/login';
  static const String logout = '/api/v1/auth/logout';
  static const String registerPatient = '/api/v1/auth/register/patient';
  static const String registerPhysiotherapist =
      '/api/v1/auth/register/physiotherapist';

  // Patients
  static const String patientMe = '/api/v1/patients/me';
  static const String patientConnect = '/api/v1/patients/connect';

  // Catalog
  static const String catalog = '/api/v1/catalog';

  // Exercises (patient HEP)
  static const String exercises = '/api/v1/exercises';
  static String exerciseById(String hepId) => '/api/v1/exercises/$hepId';

  // Exercise requests
  static const String exerciseRequests = '/api/v1/exercise/requests';
  static String exerciseRequestById(String requestId) =>
      '/api/v1/exercise/requests/$requestId';

  // Notifications
  static const String notifications = '/api/v1/notifications';
  static String notificationRead(String notificationId) =>
      '/api/v1/notifications/$notificationId/read';

  // Physiotherapists
  static const String physiotherapistMe = '/api/v1/physiotherapists/me';
  static const String physiotherapistRegister =
      '/api/v1/physiotherapists/register';
}
