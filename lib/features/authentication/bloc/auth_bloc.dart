import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_shopping_app/features/authentication/data/repositoty/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  String? phoneNumber;
  String? otpCode;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthVerifyUser>(_onVerifyUser);
    on<AuthValidateOtp>(_onValidateOtp);
  }

  Future<void> _onVerifyUser(
      AuthVerifyUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.verifyUser(event.phone);
      phoneNumber = event.phone;
      otpCode = user.otp;

      emit(AuthOtpSent(otp: user.otp, isNewUser: !user.user));
    } catch (e) {
      log("error from bloc $e");
      emit(AuthFailure(message: "Error verifying user: $e"));
    }
  }

  Future<void> _onValidateOtp(
      AuthValidateOtp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // if (event.enteredOtp == otpCode) {
      //   if (event.isExistingUser) {
      //     emit(AuthSuccess(token: event.token));
      //   } else {
      //     final token = await authRepository.registerUser(phoneNumber!, event.enteredOtp);
      //     emit(AuthSuccess(token: token));
      //   }
      // } else {
      //   emit(AuthFailure(message: "Invalid OTP"));
      // }
    } catch (e) {
      emit(AuthFailure(message: "Error validating OTP: $e"));
    }
  }
}
