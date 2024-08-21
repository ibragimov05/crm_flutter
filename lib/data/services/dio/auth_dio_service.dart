import 'package:crm_flutter/data/services/shared_prefs/shared_prefs_service.dart';
import 'package:dio/dio.dart';

import '../../models/app_response.dart';
import '../../../core/network/dio_client.dart';

class AuthDioService {
  final DioClient _dioClient = DioClient();

  /// login user using [phone] and [password]
  Future<AppResponse> login({
    required String phone,
    required String password,
  }) async {
    final AppResponse appResponse = AppResponse();

    try {
      final response = await _dioClient.post(url: '/login', data: {
        'phone': phone,
        'password': password,
      });

      appResponse.data = response.data;

      await SharedPrefsService.saveAccessToken(
        appResponse.data['data']['token'],
      );
    } catch (e) {
      if (e is DioException) {
        appResponse.statusCode = e.response?.statusCode;
      }
      appResponse.isSuccess = false;
      appResponse.errorMessage = e.toString();
    }

    return appResponse;
  }

  /// register new user using
  /// [name], [phone], [password], [passwordConfirmation]
  Future<AppResponse> register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final AppResponse appResponse = AppResponse();

    try {
      final response = await _dioClient.post(
        url: '/register',
        data: {
          'name': name,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      appResponse.data = response.data;

      await SharedPrefsService.saveAccessToken(
        appResponse.data['data']['token'],
      );
    } catch (e) {
      if (e is DioException) {
        appResponse.statusCode = e.response?.statusCode;
      }
      appResponse.isSuccess = false;
      appResponse.errorMessage = e.toString();
    }

    return appResponse;
  }

  /// logout user
  Future<AppResponse> logOut() async {
    final AppResponse appResponse = AppResponse();

    try {
      _dioClient.post(url: '/logout');
    } catch (e) {
      appResponse.isSuccess = false;
      if (e is DioException) {
        appResponse.statusCode = e.response?.statusCode;
      }
      appResponse.errorMessage = e.toString();
    }

    return appResponse;
  }

  String? checkTokenExpiry() => SharedPrefsService.getAccessToken();
}
