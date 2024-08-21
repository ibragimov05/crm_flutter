part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(Name.pure()) Name name,
    @Default(Password.pure()) Password password,
    @Default(ConfirmedPassword.pure()) ConfirmedPassword confirmedPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(0) int roleId,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _RegisterState;
}
