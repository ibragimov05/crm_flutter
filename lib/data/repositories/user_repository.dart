import 'package:crm_flutter/data/models/app_response.dart';
import 'package:crm_flutter/data/services/dio/user_dio_service.dart';

class UserRepository {
  final UserDioService _userDioService;

  UserRepository({required UserDioService userDioService})
      : _userDioService = userDioService;

  Future<AppResponse> getUser() async => await _userDioService.getUser();
}
