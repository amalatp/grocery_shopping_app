part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthVerifyUser extends AuthEvent {
  final String phone;
  AuthVerifyUser({required this.phone});
}

class AuthValidateOtp extends AuthEvent {
  final String enteredOtp;
  final bool isExistingUser;
  final String token;

  AuthValidateOtp(
      {required this.enteredOtp,
      required this.isExistingUser,
      required this.token});
}
