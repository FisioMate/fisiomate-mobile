import 'package:dio/dio.dart';
import 'package:fisiomate/core/environments/config.dart';
import 'package:fisiomate/core/errors/failure.dart';
import 'package:fisiomate/services/logger_service.dart';
import 'package:fisiomate/services/storage/token_storage.dart';

class Client {
  final Dio _dio;

  Client({Dio? dio}) : _dio = dio ?? _buildDio();

  static Dio _buildDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = TokenStorage.accessToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );

    return dio;
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

  Future<Response<dynamic>> post(String path, {dynamic data, Options? options}) {
    return apiCall(() => _dio.post(path, data: data, options: options));
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
