import 'package:outernet/data/data_sources/local_datasouces/secure_storage.dart';
import 'package:outernet/env/config.dart';
import 'package:outernet/env/log_service.dart';
import 'package:dio/dio.dart';

final logger = LogService().logger;
final baseUrl = ConfigManager().config.apiBaseUrl;

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;

  static void initDio() {
    appAPI = Dio(_baseOptions(baseUrl));
    appAPI.interceptors.add(_loggerInterceptor());
    appAPI.interceptors.add(_appQueuedInterceptorsWrapper());

    retryAPI = Dio(_baseOptions(baseUrl));
    retryAPI.interceptors.add(_loggerInterceptor());
    retryAPI.interceptors.add(_interceptorsWrapper());
  }

  static LoggerInterceptor _loggerInterceptor() {
    return LoggerInterceptor(
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  static QueuedInterceptorsWrapper _appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        final headers = await _getHeaders();
        options.headers = headers;
        appAPI.options.headers = headers;
        return handler.next(options);
      },
      onError: (DioError error, handler) async {
        if (error.response?.statusCode == 401) {
          final newToken = await _refreshToken();
          if (newToken != null) {
            final options = error.requestOptions;
            options.headers["Authorization"] = "Bearer $newToken";
            final response = await retryAPI.request(
              options.path,
              options: Options(
                method: options.method,
                headers: options.headers,
                responseType: options.responseType,
                contentType: options.contentType,
                extra: options.extra,
                followRedirects: options.followRedirects,
                listFormat: options.listFormat,
                maxRedirects: options.maxRedirects,
                receiveDataWhenStatusError: options.receiveDataWhenStatusError,
                receiveTimeout: options.receiveTimeout,
                requestEncoder: options.requestEncoder,
                responseDecoder: options.responseDecoder,
                sendTimeout: options.sendTimeout,
                validateStatus: options.validateStatus,
              ),
            );
            return handler.resolve(response);
          }
        }
        return handler.next(error);
      },
      onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) async {
        return handler.next(response);
      },
    );
  }

  static InterceptorsWrapper _interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        final headers = await _getHeaders();
        options.headers = headers;
        appAPI.options.headers = headers;
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) async {
        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
        } else {
          return handler.next(response);
        }
      },
      onError: (DioError error, handler) {
        return handler.next(error);
      },
    );
  }

  static BaseOptions _baseOptions(String url) {
    return BaseOptions(
      baseUrl: url,
      validateStatus: (status) {
        return status! < 300;
      },
      headers: {},
      responseType: ResponseType.json,
    );
  }

  static Future<Map<String, dynamic>> _getHeaders() async {
    final token = await SecureStorage.instance.read('jwt_token');
    return {
      "Authorization": token != null ? "Bearer $token" : null,
      "Content-Type": "application/json",
    }..removeWhere((key, value) => value == null);
  }

  static Future<String?> _refreshToken() async {
    // Implement logic to refresh JWT token
    final newToken = "new_jwt_token"; // Replace with actual token refresh logic
    await SecureStorage.instance.write('jwt_token', newToken);
    return newToken;
  }
}

class LoggerInterceptor extends Interceptor {
  final bool request;
  final bool requestBody;
  final bool error;
  final bool responseBody;
  final bool responseHeader;
  final bool requestHeader;

  LoggerInterceptor({
    this.request = true,
    this.requestBody = true,
    this.error = true,
    this.responseBody = true,
    this.responseHeader = true,
    this.requestHeader = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (request) {
      logger.i("Request: ${options.method} ${options.path}");
    }
    if (requestHeader) {
      logger.i("Request Headers: ${options.headers}");
    }
    if (requestBody) {
      logger.i("Request Body: ${options.data}");
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (responseHeader) {
      logger.i("Response Headers: ${response.headers}");
    }
    if (responseBody) {
      logger.i("Response Body: ${response.data}");
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (error) {

      logger.e("Error: ${err.message} \n Response code: ${err.response?.statusCode} \n Response data: ${err.response?.data}");
    }
    handler.next(err);
  }
}