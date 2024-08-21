import 'package:auth_form_inputs/auth_form_inputs.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

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
}
