part of 'admin_group_management_bloc.dart';

@immutable
sealed class AdminGroupManagementEvent {
  const AdminGroupManagementEvent();
}

final class GetAllGroupsAdminManEvent extends AdminGroupManagementEvent {
  const GetAllGroupsAdminManEvent();
}

final class AddGroupAdminManEvent extends AdminGroupManagementEvent {
  final AddGroupRequest newGroup;

  const AddGroupAdminManEvent({required this.newGroup});
}

final class EditGroupAdminManEvent extends AdminGroupManagementEvent {
  final int groupId;
  final String newName;
  final int newMainTeacherId;
  final int newAssistantTeacherId;

  const EditGroupAdminManEvent({
    required this.groupId,
    required this.newName,
    required this.newMainTeacherId,
    required this.newAssistantTeacherId,
  });
}