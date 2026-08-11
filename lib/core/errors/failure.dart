import 'package:dio/dio.dart';

sealed class Failure {
  final String message;

  const Failure(this.message);
}

class DioFailure extends Failure {
  final int? statusCode;

  const DioFailure({required String message, this.statusCode})
    : super(message);

  factory DioFailure.fromDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;

    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => const DioFailure(
        message: 'Koneksi ke server timeout, silakan coba lagi.',
      ),
      DioExceptionType.connectionError => const DioFailure(
        message: 'Tidak ada koneksi internet.',
      ),
      DioExceptionType.cancel => const DioFailure(
        message: 'Permintaan dibatalkan.',
      ),
      DioExceptionType.badResponse => DioFailure(
        message: 'Terjadi kesalahan pada server.',
        statusCode: statusCode,
      ),
      DioExceptionType.badCertificate ||
      DioExceptionType.unknown => DioFailure(
        message: exception.message ?? 'Terjadi kesalahan yang tidak diketahui.',
        statusCode: statusCode,
      ),
    };
  }
}
