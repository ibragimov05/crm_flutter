part of 'admin_group_management_bloc.dart';

@immutable
sealed class AdminGroupManagementState {
  const AdminGroupManagementState();
}

final class InitialAdminGroupManagementState extends AdminGroupManagementState {
  const InitialAdminGroupManagementState();
}

final class LoadingAdminGroupManagementState extends AdminGroupManagementState {
  const LoadingAdminGroupManagementState();
}

final class LoadedAdminGroupManagementState extends AdminGroupManagementState {
  final List<Group> allGroups;

  const LoadedAdminGroupManagementState({required this.allGroups});
}

final class ErrorAdminGroupManagementState extends AdminGroupManagementState {
  final String errorMessage;

  const ErrorAdminGroupManagementState({required this.errorMessage});
}
