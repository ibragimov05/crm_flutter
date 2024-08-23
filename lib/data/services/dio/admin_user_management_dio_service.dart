import 'package:crm_flutter/core/network/dio_client.dart';
import 'package:dio/dio.dart';

import '../../models/app_response.dart';

class AdminManagementDioService {
  final DioClient _dioClient = DioClient();

  Future<AppResponse> getAllUsers() async {
    final AppResponse appResponse = AppResponse();

    try {
      final response = await _dioClient.get(url: '/users');

      appResponse.data = response.data['data'];
    } catch (e) {
      if (e is DioException) {
        appResponse.statusCode = e.response?.statusCode;
      }
      appResponse.errorMessage = e.toString();
      appResponse.isSuccess = false;
    }

    return appResponse;
  }

  Future<AppResponse> editGroup({
    required int groupId,
    required String newName,
    required int newMainTeacherId,
    required int newAssistantTeacherId,
  }) async {
    final AppResponse appResponse = AppResponse();

    try {
      final response = await _dioClient.put(
        url: 'groups/$groupId',
        data: {
          "name": newName,
          "main_teacher_id": newMainTeacherId,
          "assistant_teacher_id": newAssistantTeacherId,
        },
      );
      appResponse.data = response.data;
    } catch (e) {
      if (e is DioException) {
        appResponse.statusCode = e.response?.statusCode;
      }
      appResponse.errorMessage = e.toString();
      appResponse.isSuccess = false;
    }

    return appResponse;
  }
}
