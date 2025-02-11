part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthOtpSent extends AuthState {
  final String otp;
  final bool isNewUser;

  AuthOtpSent({required this.otp, required this.isNewUser});
}

class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess({required this.token});
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}
