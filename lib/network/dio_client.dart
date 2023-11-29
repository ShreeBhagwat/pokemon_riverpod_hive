import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokemon_riverpod/utils/constant.dart';

class DioClient {
  final Dio _dio;
  DioClient(this._dio) {
    _dio
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true))
      ..options.baseUrl = POKEMON_API_URL
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 5)
      ..options.headers = {
        'Content-Type': 'application/json',
        'x-api-key': 'pokemondemokey'
      };
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioException catch (e) {
      return Future.error(DioErrorHandler.fromDioError(e).message);
    }
  }

  Future<Response> post(String url, dynamic data) async {
    final response = await _dio.post(url, data: data);
    return response;
  }
}

class DioErrorHandler implements Exception {
  late String message;

  DioErrorHandler.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionError:
        message = 'Connection to API server failed due to internet connection';
        break;
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message =
            handleBadResponse(dioException.response!.statusCode, dioException);
        break;
      case DioExceptionType.sendTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }

  String handleBadResponse(int? statusCode, error) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Data not found';
      case 500:
        return 'Internal Server Error';
      default:
        return error.toString();
    }
  }
}
