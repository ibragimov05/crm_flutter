part of 'admin_management_bloc.dart';

enum AdminManagementStatus { initial, loading, loaded, error }

@freezed
class AdminManagementState with _$AdminManagementState {
  const factory AdminManagementState({
    List<User>? users,
    @Default(AdminManagementStatus.initial)
    AdminManagementStatus adminManagementStatus,
    String? error,
  }) = _AdminManagementState;
}
