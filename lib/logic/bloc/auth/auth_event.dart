part of 'auth_bloc.dart';

enum SocialLoginType { google, facebook, github }

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginUser({
    required String phoneNumber,
    required String password,
  }) = LoginUserEvent;

  const factory AuthEvent.socialLogin({
    required SocialLoginType type,
     String? email,
     String? name,
  }) = SocialLoginEvent;

  const factory AuthEvent.registerUser({
    required String name,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
    required int roleId,
  }) = RegisterUserEvent;

  const factory AuthEvent.resetPassword({required String phoneNumber}) =
      ResetPasswordEvent;

  const factory AuthEvent.checkTokenExpiry() = CheckTokenExpiryEvent;

  const factory AuthEvent.logout() = LogoutEvent;
}
