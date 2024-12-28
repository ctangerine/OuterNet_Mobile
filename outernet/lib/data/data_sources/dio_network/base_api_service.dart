import 'package:dio/dio.dart';
import 'package:outernet/env/log_service.dart';

final logger = LogService().logger;

typedef ResponseHandler<T> = T Function(Response response);
typedef ErrorHandler = String Function(Response? response);

class BaseApiService {
  final Dio dio;

  BaseApiService(this.dio);

  Future<T> handleRequest<T>({
    required Future<Response> Function() request,
    required ResponseHandler<T> onSuccess,
    Map<int, ErrorHandler>? customErrorHandlers,
    ErrorHandler? defaultErrorHandler,
    String Function(Exception e)? onCatchError,
  }) async {
    try {
      final response = await request();
      logger.i('Request succeeded: ${response.data}');

      if (customErrorHandlers != null && customErrorHandlers.containsKey(response.statusCode)) {
        throw Exception(customErrorHandlers[response.statusCode]?.call(response));
      }

      if (response.statusCode == 200 || response.statusCode == 204 || response.statusCode == 201) {
        return onSuccess(response);
      } else {
        throw Exception(
            defaultErrorHandler?.call(response) ?? 'Unexpected error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      logger.e('DioException: ${e.response?.data}');
      throw Exception(defaultErrorHandler?.call(e.response) ?? 'Dio error occurred');
    } catch (e) {
      logger.e('Exception: ${e.toString()}');
      throw Exception(onCatchError?.call(e as Exception) ?? 'An unexpected error occurred');
    }
  }
}



class ErrorResponseMapper {
  static String mapError(int? statusCode, Response? response) {
    switch (statusCode) {
      case 400:
        return 'Yêu cầu không hợp lệ';
      case 401:
        return 'Bạn chưa đăng nhập';
      case 403:
        return 'Không có quyền truy cập';
      case 500:
        return 'Lỗi máy chủ nội bộ';
      default:
        return 'Lỗi không xác định: ${response?.statusMessage}';
    }
  }
}
