import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/features/authentication/screens/login_screen.dart';
import 'package:grocery_shopping_app/features/authentication/screens/new_user_screen.dart';
import 'package:grocery_shopping_app/features/authentication/screens/splash_screen.dart';
import 'package:grocery_shopping_app/features/authentication/screens/verify_otp_screen.dart';

Map<String, WidgetBuilder> routesName = {
  '/': (context) => const SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/verify_otp': (context) => const VerifyOtpScreen(),
  '/new_user': (context) => const NewUserScreen(),
};
