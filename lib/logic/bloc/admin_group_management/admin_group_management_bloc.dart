import 'package:bloc/bloc.dart';
import 'package:crm_flutter/data/models/groups/add_group_request.dart';
import 'package:crm_flutter/data/models/groups/group.dart';
import 'package:crm_flutter/data/repositories/admin_group_management_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

part 'admin_group_management_event.dart';

part 'admin_group_management_state.dart';

class AdminGroupManagementBloc
    extends Bloc<AdminGroupManagementEvent, AdminGroupManagementState> {
  final AdminGroupManagementRepository _adminGroupManagementRepository;

  AdminGroupManagementBloc({
    required AdminGroupManagementRepository adminGroupManagementRepository,
  })  : _adminGroupManagementRepository = adminGroupManagementRepository,
        super(const InitialAdminGroupManagementState()) {
    on<GetAllGroupsAdminManEvent>(_onGetAllGroups);
    on<AddGroupAdminManEvent>(_onAddGroup);
  }

  void _onGetAllGroups(
    GetAllGroupsAdminManEvent event,
    Emitter<AdminGroupManagementState> emit,
  ) async {
    emit(const LoadingAdminGroupManagementState());

    try {
      final appResponse = await _adminGroupManagementRepository.getAllGroups();

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        List<Group> allGroups = [];

        for (var data in (appResponse.data as List)) {
          allGroups.add(Group.fromJson(data));
        }

        emit(LoadedAdminGroupManagementState(allGroups: allGroups));
      } else {
        throw 'error: {status_code: ${appResponse.statusCode}, "error_message": ${appResponse.errorMessage}}';
      }
    } catch (e) {
      emit(ErrorAdminGroupManagementState(errorMessage: e.toString()));
    }
  }

  void _onAddGroup(
    AddGroupAdminManEvent event,
    Emitter<AdminGroupManagementState> emit,
  ) async {
    emit(const LoadingAdminGroupManagementState());

    try {
      final appResponse =
          await _adminGroupManagementRepository.addGroup(event.newGroup);

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        print('------------------------------------------------');
        print('SUCCESS');
        print('------------------------------------------------');
        print('SUCCESS');
        print('------------------------------------------------');

        add(const GetAllGroupsAdminManEvent());
      } else {
        throw 'error: {status_code: ${appResponse.statusCode}, "error_message": ${appResponse.errorMessage}}';
      }
    } catch (e) {
      emit(ErrorAdminGroupManagementState(errorMessage: e.toString()));
    }
  }
}
