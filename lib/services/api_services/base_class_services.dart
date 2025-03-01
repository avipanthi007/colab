import 'package:colab/core/utils/constants/api_constant.dart';
import 'package:colab/core/utils/helper.dart';
import 'package:colab/core/utils/local_storage/shared_pref.dart';
import 'package:colab/services/api_services/api_exception.dart';
import 'package:dio/dio.dart';

class ApiBaseClientService {
  late Dio _dio;
  Future<String?> _getToken() async {
    return await LocalStorage.getToken("token");
  }

  ApiBaseClientService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 25),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await _getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Future<Response> request({
    required String endpoint,
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
    FormData? formData,
  }) async {
    try {
      Response response = await _dio.request(
        endpoint,
        data: isMultipart ? formData : data,
        queryParameters: queryParams,
        options: Options(method: method),
      );
      infoLog('$method $endpoint - Response: ${response.data}');
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  ApiExceptions _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        throw ApiExceptions(
            message: 'Request cancelled', data: error.response?.data);

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw TimeoutException(message: 'Request timeout');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        final errorMessage =
            data is Map<String, dynamic> ? data['error'] : 'An error occurred';

        if (statusCode == 400) {
          throw BadRequestException(
              message: errorMessage,
              data: data); 
        } else if (statusCode == 401) {
          throw UnauthorizedException(message: 'Unauthorized', data: data);
        } else if (statusCode == 503) {
          throw NoInternetException(message: 'Service unavailable');
        }
        throw ApiExceptions(
          message: 'Error with status code $statusCode',
          statusCode: statusCode,
          data: data,
        );

      case DioExceptionType.connectionError:
        throw ApiExceptions(
            message:
                'A connection error occurred. Please check your network and try again.',
            data: error.message);

      case DioExceptionType.unknown:
        print(error.error);
        if (error.error is ApiExceptions) {
          final apiException = error.error as ApiExceptions;
          throw UnknownException(
            message: apiException.data['data'],
            data: apiException.data,
          );
        }
        throw UnknownException(
          message: error.error?.toString() ?? 'Unknown error',
          data: error.message,
        );
      case DioExceptionType.badCertificate:
        throw UnknownException(message: 'Unknown error', data: error.message);
    }
  }
}
