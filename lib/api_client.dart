import 'package:dio/dio.dart';
import 'package:uplash_task/base_url.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: apiBaseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
    headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    },
  ),
);
