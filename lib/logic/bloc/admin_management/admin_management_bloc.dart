import 'package:bloc/bloc.dart';
import 'package:crm_flutter/data/models/user/user.dart';
import 'package:crm_flutter/data/repositories/admin_management_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_management_bloc.freezed.dart';

part 'admin_management_event.dart';

part 'admin_management_state.dart';

class AdminManagementBloc
    extends Bloc<AdminManagementEvent, AdminManagementState> {
  final AdminManagementRepository _adminManagementRepository;

  AdminManagementBloc({
    required AdminManagementRepository adminManagementRepository,
  })  : _adminManagementRepository = adminManagementRepository,
        super(const AdminManagementState()) {
    on<GetAllUsersEvent>(_onGetAllUsers);
  }

  void _onGetAllUsers(
    GetAllUsersEvent event,
    Emitter<AdminManagementState> emit,
  ) async {
    emit(state.copyWith(adminManagementStatus: AdminManagementStatus.loading));

    try {
      final appResponse = await _adminManagementRepository.getAllUsers();

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        List<User> allUsers = [];

        for(var data in (appResponse.data as List)){
          allUsers.add(User.fromJson(data));
        }

        emit(state.copyWith(
          adminManagementStatus: AdminManagementStatus.loaded,
          users: allUsers,
        ));
      } else {
        throw 'error: {status_code: ${appResponse.statusCode}, "error_message": ${appResponse.errorMessage}}';
      }
    } catch (e) {
      emit(state.copyWith(
        adminManagementStatus: AdminManagementStatus.error,
        error: e.toString(),
      ));
    }
  }
}
