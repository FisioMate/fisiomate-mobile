import 'package:dio/dio.dart';
import 'package:fisiomate/core/environments/config.dart';
import 'package:fisiomate/core/errors/failure.dart';
import 'package:fisiomate/services/logger_service.dart';

class Client {
  final Dio _dio;

  Client({Dio? dio}) : _dio = dio ?? _buildDio();

  static Dio _buildDio() {
    return Dio(
      BaseOptions(
        baseUrl: Config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response<dynamic>> apiCall(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      final response = await request();
      LoggerService.i(
        '${response.requestOptions.method} ${response.requestOptions.path} '
        '-> ${response.statusCode}',
      );
      return response;
    } on DioException catch (e, stackTrace) {
      LoggerService.e(
        '${e.requestOptions.method} ${e.requestOptions.path} failed',
        e,
        stackTrace,
      );
      throw DioFailure.fromDioException(e);
    }
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return apiCall(() => _dio.get(path, queryParameters: queryParameters));
  }

  Future<Response<dynamic>> post(String path, {dynamic data}) {
    return apiCall(() => _dio.post(path, data: data));
  }

  Future<Response<dynamic>> put(String path, {dynamic data}) {
    return apiCall(() => _dio.put(path, data: data));
  }

  Future<Response<dynamic>> patch(String path, {dynamic data}) {
    return apiCall(() => _dio.patch(path, data: data));
  }

  Future<Response<dynamic>> delete(String path, {dynamic data}) {
    return apiCall(() => _dio.delete(path, data: data));
  }
}
