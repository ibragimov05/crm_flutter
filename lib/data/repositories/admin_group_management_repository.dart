import 'package:crm_flutter/data/models/app_response.dart';
import 'package:crm_flutter/data/models/groups/add_group_request.dart';
import 'package:crm_flutter/data/services/dio/admin_group_management_dio_service.dart';

class AdminGroupManagementRepository {
  final AdminGroupManagementDioService _adminGroupManagementDioService;

  AdminGroupManagementRepository({
    required AdminGroupManagementDioService adminGroupManagementDioService,
  }) : _adminGroupManagementDioService = adminGroupManagementDioService;

  Future<AppResponse> getAllGroups() async =>
      _adminGroupManagementDioService.getAllGroups();

  Future<AppResponse> addGroup(AddGroupRequest newGroup) async =>
      _adminGroupManagementDioService.addNewGroup(newGroup);
}
