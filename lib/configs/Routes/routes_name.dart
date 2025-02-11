import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:grocery_shopping_app/features/authentication/presentation/screens/new_user_screen.dart';
import 'package:grocery_shopping_app/features/authentication/presentation/screens/splash_screen.dart';
import 'package:grocery_shopping_app/features/authentication/presentation/screens/verify_otp_screen.dart';
import 'package:grocery_shopping_app/features/bottom_nav_bar/presentation/screens/bottom_nav_bar.dart';

Map<String, WidgetBuilder> routesName = {
  '/': (context) => const SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/verify_otp': (context) => const VerifyOtpScreen(),
  '/new_user': (context) => const NewUserScreen(),
  '/bottom_nav_bar': (context) => const BottomNavBar(),
};
