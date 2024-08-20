import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();

  DioClient._private() {
    _dio.options
      ..baseUrl = 'http://millima.flutterwithakmaljon.uz/api'
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..responseType = ResponseType.json;
  }

  static final _singletonConstructor = DioClient._private();

  factory DioClient() => _singletonConstructor;

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      /// /////////////////////////////////////////////////////////////
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: {'authorization': 'Bearer \\'}),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({required String url}) async {
    try {
      return await _dio.delete(url);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}