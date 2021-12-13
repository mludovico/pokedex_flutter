import 'dart:io';

import 'package:dio/dio.dart';

abstract class CustomDio {
  static Dio buildClient() {
    final dio = Dio();
    dio.interceptors.addAll([
      CommonApiInterceptor(),
    ]);
    return dio;
  }
}

class CommonApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    options.validateStatus = (code) => code! < HttpStatus.internalServerError;
    return handler.next(options);
  }
}
