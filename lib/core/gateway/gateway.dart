import 'package:dio/dio.dart';
import 'package:pokedex/core/http/http.dart';

class DioHttp implements IHttp {
  late Dio _dio;

  DioHttp() {
    _dio = Dio();
  }

  @override
  Future<Response<dynamic>> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  @override
  Future<Response<dynamic>> post(String url, dynamic data, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(url, data: data, queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  @override
  Future<Response<dynamic>> put(String url, dynamic data, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(url, data: data, queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw Exception('Failed to perform PUT request: $error');
    }
  }

  @override
  Future<Response<dynamic>> patch(String path, dynamic data, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.patch(path, data: data, queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw Exception('Failed to perform PATCH request: $error');
    }
  }

  @override
  Future<Response<dynamic>> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, data: data, queryParameters: queryParameters);
      return response;
    } catch (error) {
      throw Exception('Failed to perform DELETE request: $error');
    }
  }
}
