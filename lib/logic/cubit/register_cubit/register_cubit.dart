import 'package:auth_form_inputs/auth_form_inputs.dart';
import 'package:bloc/bloc.dart';
import 'package:crm_flutter/data/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegisterState());

  void nameChanged(String value) {
    final name = Name.dirty(value);

    emit(state.copyWith(
      name: name,
      status: FormzSubmissionStatus.initial,
      isValid: Formz.validate([
        name,
        state.phoneNumber,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);

    emit(state.copyWith(
      phoneNumber: phoneNumber,
      status: FormzSubmissionStatus.initial,
      isValid: Formz.validate([
        state.name,
        phoneNumber,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      status: FormzSubmissionStatus.initial,
      isValid: Formz.validate([
        state.name,
        state.phoneNumber,
        password,
        state.confirmedPassword,
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );

    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      isValid: Formz.validate([
        state.name,
        state.phoneNumber,
        state.password,
        confirmedPassword,
      ]),
    ));
  }

  void signUpFormSubmitted() async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      final appResponse = await _authRepository.register(
        phone: state.phoneNumber.value,
        name: state.name.value,
        password: state.password.value,
        passwordConfirmation: state.confirmedPassword.value,
      );

      if (appResponse.isSuccess && appResponse.errorMessage.isEmpty) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        throw 'error: {status_code: ${appResponse.statusCode}, error_message: ${appResponse.errorMessage}';
      }
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
