import 'package:dio/dio.dart';
import 'package:e5d_assesment/core/network/endpoints.dart';
import 'package:flutter/services.dart';


class MockDioAdapter implements HttpClientAdapter {
  MockDioAdapter();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future? cancelFuture,
  ) async {
    switch (options.path) {
      case ApiEndpoints.testEndPoint:
        final mockData = await rootBundle
            .loadString('assets/mock/login.json');

        return ResponseBody.fromString(
          mockData,
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      default:
        return ResponseBody.fromString(
            'Not Found -> check MockDioAdapter, add path here', 404);
    }
  }

  @override
  void close({bool force = false}) {}

  // Since we're implementing the HttpClientAdapter, there may be other methods or properties you need to implement, even if they just throw UnimplementedError.
  // For example:

  Future<ResponseBody> send(RequestOptions options) {
    throw UnimplementedError();
  }

// Include other methods or properties from HttpClientAdapter and implement or mock them as necessary.
}
