import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

class WebServices {

  static WebServices? _this;

  factory WebServices() {
    _this ??= WebServices._();
    return _this!;
  }

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  String lang = "en";

  String? mytoken;
  String mobile = "";
  final String storageKeyMobileToken = "Authorization";

  WebServices._() {
    freeDio.options.connectTimeout = const Duration(milliseconds: 30000);
    freeDio.options.baseUrl = Constants.baseUrl;

    tokenDio.options.connectTimeout = const Duration(milliseconds: 30000);
    tokenDio.options.baseUrl = Constants.baseUrl;
    initializeInterceptors();
  }
  initializeInterceptors() {


    // Clearing Interceptors
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();

    // freeDio Interceptors
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["lang"] = "en";
          options.headers["appVersion"] = "1.1.0";
          options.headers["platform"] = "ios";


          debugPrint(
              'send request：baseURL:${options.baseUrl} path:${options.path}，');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {
          debugPrint("status code: ${response.statusCode}");
          debugPrint("status code: ${response.requestOptions.path}");
          debugPrint("data: ${response.data}");

          // Do something with response data
          log(response.data.toString());
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");
          if (e.response != null) {
            if (e.response!.statusCode == 401 ||
                e.response!.statusCode == 403) {
              return handler.next(e);
            } else {
              // 500 error internal
              // ToastService.showUnExpectedErrorToast();
            }
          } else {
            debugPrint(e.requestOptions.path);
            debugPrint(e.toString());

          }
        },
      ),
    );

    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path != "digitalapi/profile/digitalBE/token/resetData")
            // EasyLoading.show();
            // Do something before request is sent
            options.headers["Accept-Language"] =
            // navigatorKey.currentContext!.locale;
            options.headers["Authorization"] = "Bearer $mytoken";

          debugPrint(
              'send request path:${options.path}，baseURL:${options.baseUrl}');
          debugPrint("method: ${options.method}");
          debugPrint('headers: ${options.headers}');
          debugPrint('data: ${options.data}');

          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          debugPrint('status code: ${response.statusCode}');
          debugPrint('data: ${response.data}');
          // Do something with response data

          log(response.data.toString());

          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");

          //
        },
      ),
    );

  }
}
