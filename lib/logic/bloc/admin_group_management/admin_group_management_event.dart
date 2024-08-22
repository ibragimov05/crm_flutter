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
