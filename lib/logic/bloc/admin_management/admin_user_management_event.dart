part of 'admin_user_management_bloc.dart';

@freezed
class AdminUserManagementEvent with _$AdminUserManagementEvent {
  const factory AdminUserManagementEvent.getAllUsers() = GetAllUsersEvent;

  const factory AdminUserManagementEvent.editGroupsMainTeacher({
    required int groupId,
    required String newName,
    required int newMainTeacherId,
    required int newAssistantTeacherId,
  }) = EditGroupsMainTeacherEvent;
}
