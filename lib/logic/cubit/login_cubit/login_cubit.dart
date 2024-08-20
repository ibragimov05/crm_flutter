import 'package:auth_form_inputs/auth_form_inputs.dart';
import 'package:bloc/bloc.dart';
import 'package:crm_flutter/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState());

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);

    emit(state.copyWith(
      phoneNumber: phoneNumber,
      status: FormzSubmissionStatus.initial,
      isValid: Formz.validate([phoneNumber, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      status: FormzSubmissionStatus.initial,
      isValid: Formz.validate([state.phoneNumber, password]),
    ));
  }

  void loginWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      final appResponse = await _authRepository.login(
        phone: state.phoneNumber.value,
        password: state.password.value,
      );

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        throw appResponse.errorMessage;
      }
    } catch (e) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
