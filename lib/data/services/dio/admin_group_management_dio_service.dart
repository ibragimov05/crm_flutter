import 'package:crm_flutter/core/network/dio_client.dart';
import 'package:crm_flutter/data/models/groups/add_group_request.dart';
import 'package:dio/dio.dart';

import '../../models/app_response.dart';

class AdminGroupManagementDioService {
  final DioClient _dioClient = DioClient();

  Future<AppResponse> getAllGroups() async {
    final AppResponse appResponse = AppResponse();

    try {
      final response = await _dioClient.get(url: '/groups');

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

  Future<AppResponse> addNewGroup(AddGroupRequest newGroup) async {
    final AppResponse appResponse = AppResponse();

    try {
      final response = await _dioClient.post(
        url: '/groups',
        data: newGroup.toMap(),
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
