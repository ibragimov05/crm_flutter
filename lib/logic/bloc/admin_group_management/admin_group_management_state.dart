part of 'admin_group_management_bloc.dart';

@immutable
sealed class AdminGroupManagementState {
  const AdminGroupManagementState();
}

final class InitialAdminGroupState extends AdminGroupManagementState {
  const InitialAdminGroupState();
}

final class LoadingAdminGroupState extends AdminGroupManagementState {
  const LoadingAdminGroupState();
}

final class LoadedAdminGroupState extends AdminGroupManagementState {
  final List<Group> allGroups;

  const LoadedAdminGroupState({required this.allGroups});
}

final class ErrorAdminGroupState extends AdminGroupManagementState {
  final String errorMessage;

  const ErrorAdminGroupState({required this.errorMessage});
}

