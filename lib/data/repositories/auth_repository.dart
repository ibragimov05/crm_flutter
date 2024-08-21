import 'package:crm_flutter/data/models/app_response.dart';
import 'package:crm_flutter/data/services/dio/auth_dio_service.dart';

class AuthRepository {
  final AuthDioService _authDioService;

  AuthRepository({required AuthDioService authDioService})
      : _authDioService = authDioService;

  Future<AppResponse> login({
    required String phone,
    required String password,
  }) async =>
      _authDioService.login(phone: phone, password: password);

  Future<AppResponse> register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async =>
      _authDioService.register(
        name: name,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

  String? checkTokenExpiry() => _authDioService.checkTokenExpiry();
}
