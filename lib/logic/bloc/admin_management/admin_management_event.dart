part of 'admin_management_bloc.dart';

@freezed
class AdminManagementEvent with _$AdminManagementEvent {
  const factory AdminManagementEvent.getAllUsers() = GetAllUsersEvent;
}
