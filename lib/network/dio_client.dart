import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    final response = await _dio.get(url);
    return response;
  }

  Future<Response> post(String url, dynamic data) async {
    final response = await _dio.post(url, data: data);
    return response;
  }
  
}
