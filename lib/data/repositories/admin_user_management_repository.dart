import 'package:crm_flutter/data/models/app_response.dart';
import 'package:crm_flutter/data/services/dio/admin_user_management_dio_service.dart';

class AdminManagementRepository {
  final AdminManagementDioService _adminDioService;

  const AdminManagementRepository({
    required AdminManagementDioService adminDioService,
  }) : _adminDioService = adminDioService;

  Future<AppResponse> getAllUsers() async => _adminDioService.getAllUsers();

  Future<AppResponse> editGroups({
    required int groupId,
    required String newName,
    required int newMainTeacherId,
    required int newAssistantTeacherId,
  }) async =>
      _adminDioService.editGroup(
        groupId: groupId,
        newName: newName,
        newMainTeacherId: newMainTeacherId,
        newAssistantTeacherId: newAssistantTeacherId,
      );
}
