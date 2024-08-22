import 'package:bloc/bloc.dart';
import 'package:crm_flutter/core/utils/user_constants.dart';
import 'package:crm_flutter/data/models/user/user.dart';
import 'package:crm_flutter/data/repositories/user_repository.dart';
import 'package:crm_flutter/data/services/shared_prefs/user_shared_prefs_service.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserState()) {
    on<GetUserEvent>(_onGetUser);
    on<UpdateUserDataEvent>(_onUpdateUserData);
  }

  void _onGetUser(
    GetUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final appResponse = await _userRepository.getUser();

    try {
      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        final User user = (appResponse.data as User);

        UserData.setUserData(user);
        UserSharedPrefsService.updateUser(user);

        emit(state.copyWith(
          userStatus: UserStatus.loaded,
          user: user,
        ));
      } else {
        throw 'error: {status_code: ${appResponse.statusCode}, "error_message": ${appResponse.errorMessage}}';
      }
    } catch (e) {
      debugPrint("error _onGetUser UserBloc: $e");
      emit(state.copyWith(error: e.toString(), userStatus: UserStatus.error));
    }
  }

  void _onUpdateUserData(
    UpdateUserDataEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(userStatus: UserStatus.loading));

    await _userRepository.updateUser(
      email: event.email == UserData.email ? '' : event.email,
      name: event.name == UserData.name ? '' : event.name,
      phone: event.phone == UserData.phone ? '' : event.phone,
      photoPath: event.photoPath == UserData.photo ? '' : event.photoPath,
    );

    add(const UserEvent.getUserEvent());
  }
}
