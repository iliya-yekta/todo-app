import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://6adb6b6e3b7e90b8208fe8c8.mockapi.io/todo/v1/',
    sendTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 10),
    headers: {
      'Accept': 'application/json'
    }
  ),
);
