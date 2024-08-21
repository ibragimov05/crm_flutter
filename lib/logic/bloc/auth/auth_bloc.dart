import 'package:bloc/bloc.dart';
import 'package:crm_flutter/data/models/user/user.dart';
import 'package:crm_flutter/data/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/app_response.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState()) {
    on<LoginUserEvent>(_onLoginUser);
    on<RegisterUserEvent>(_onRegisterUser);
    on<ResetPasswordEvent>(_onResetPassword);
    on<CheckTokenExpiryEvent>(_onCheckTokenExpiry);
    on<LogoutEvent>(_onLogout);
  }

  void _onLoginUser(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    try {
      final AppResponse appResponse = await _authRepository.login(
        phone: event.phoneNumber,
        password: event.password,
      );

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        emit(state.copyWith(authStatus: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(
          authStatus: AuthStatus.error,
          error: appResponse.errorMessage,
        ));
      }
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }

  void _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    try {
      final AppResponse appResponse = await _authRepository.register(
        name: event.name,
        phone: event.phoneNumber,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        emit(state.copyWith(authStatus: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(
          authStatus: AuthStatus.error,
          error: appResponse.errorMessage,
        ));
      }
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }

  void _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {

    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }

  void _onCheckTokenExpiry(
    CheckTokenExpiryEvent event,
    Emitter<AuthState> emit,
  ) {
    final data = _authRepository.checkTokenExpiry();
    if (data == null) {
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    }
  }

  void _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {
      // _authRepository.log
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }
}
