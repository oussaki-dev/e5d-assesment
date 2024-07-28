import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:e5d_assesment/core/network/abstract_api_client.dart';
import 'package:e5d_assesment/core/network/mock_dio_adapter.dart';
import 'package:e5d_assesment/core/network/network_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ApiClient extends AbstractApiClient {
  
  final Dio dio;
  @override
  final String baseUrl;
  final Duration timeout;

  ApiClient({
    required this.baseUrl,
    Map<String, dynamic>? headers,
    this.timeout = const Duration(seconds: 30),
  }) : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: timeout,
            receiveTimeout: timeout,
            headers: headers,
            validateStatus: (status) =>
                (status != null) && (status ~/ 100 == 2),
          ),
        ) {
    addNetworkLoggers();
  }

  void addNetworkLoggers() {
    if (!kReleaseMode) {
      dio.interceptors.addAll([
        /// Prints Curls
        CurlLoggerDioInterceptor(printOnSuccess: true),
      ]);
    }
  }
  
  factory ApiClient.mock(Dio dio) {
    dio.httpClientAdapter = MockDioAdapter(); // Setting the MockDioAdapter
    return ApiClient._internal(
      dio,
      'https://mock.base.url',
      const Duration(seconds: 30),
    ); // You can keep this base URL, but it won't be used in mock mode
  }

  ApiClient._internal(this.dio, this.baseUrl, this.timeout);

  @override
   Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      final Map<String, dynamic> finalHeader = dio.options.headers;
      finalHeader.addAll(headers ?? {});

      debugPrint("QueryParameters:: $queryParameters");
      debugPrint("URL:: $endpoint");
      debugPrint("Header:: $finalHeader");

      debugPrint("before get in client.dart get method");

      return await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: finalHeader,
          sendTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  @override
  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      final Map<String, dynamic> finalHeader = dio.options.headers;
      finalHeader.addAll(headers ?? {});

      debugPrint("BODY:: $data");
      debugPrint("URL:: $endpoint");
      debugPrint("Header:: $finalHeader");

      debugPrint("before post in client.dart post method");

      return await dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: finalHeader,
          sendTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  @override
  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      return await dio.put(
        endpoint,
        data: data,
        options: Options(
          headers: headers,
          sendTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  @override
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      return await dio.delete(
        endpoint,
        options: Options(
          headers: headers,
          sendTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        ),
      );
    } on DioException catch (error) {
      throw handleError(error);
    }
  }

  NetworkException handleError(DioException error) {
    if (error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeoutException('Request timed out');
    } else if (error.type == DioExceptionType.badResponse) {
      switch (error.response?.statusCode) {
        case 400:
          String errorMessage =
              'Bad request.\nError Response:\n${error.response}';
          printErrorMessage(errorMessage);
          return BadRequestException(errorMessage);
        case 401:
          String errorMessage =
              'Unauthorized.\nError Response:\n${error.response}';
          printErrorMessage(errorMessage);
          return UnauthorizedException(errorMessage);
        case 404:
          String errorMessage =
              'Not found.\nError Response:\n${error.response}';
          printErrorMessage(errorMessage);
          return NotFoundException(errorMessage);
        case 500:
          String errorMessage =
              'Server error.\nError Response:\n${error.response}';
          printErrorMessage(errorMessage);
          return ServerErrorException(errorMessage);
        default:
          String errorMessage =
              'An error occurred during the request.\nError Response:\n${error.response}';
          printErrorMessage(errorMessage);
          return NetworkException(errorMessage);
      }
    } else if (error.type == DioExceptionType.cancel) {
      String errorMessage = 'Request was canceled';
      printErrorMessage(errorMessage);
      return NetworkException(errorMessage);
    } else if (error.type == DioExceptionType.unknown){
        printErrorMessage(error.error.toString());
      return NetworkException(error.error.toString());
    } else {
      String errorMessage = 'No internet connection';
      printErrorMessage(errorMessage);
      return NoInternetException(errorMessage);
    }
  }

  void printErrorMessage(String errorMessage) {
    debugPrint('**************************************************');
    debugPrint('*************** Network Exception ****************');
    debugPrint(errorMessage);
    debugPrint('**************************************************');
    debugPrint('**************************************************');
  }
}
