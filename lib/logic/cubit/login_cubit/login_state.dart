part of 'login_cubit.dart';

class LoginState extends Equatable {
  final PhoneNumber phoneNumber;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  const LoginState({
    this.phoneNumber = const PhoneNumber.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  LoginState copyWith({
    PhoneNumber? phoneNumber,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) =>
      LoginState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        status,
        isValid,
        errorMessage,
      ];
}
