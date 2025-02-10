import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            Text(
              "My Profile",
              style: TextStyle(
                  fontSize: height * 0.02, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: height * 0.035),
            Text(
              "Name",
              style: TextStyle(
                  fontSize: height * 0.014,
                  fontWeight: FontWeight.w600,
                  color: AppColors.focus),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Amala",
              style: TextStyle(
                  fontSize: height * 0.02, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: height * 0.03),
            Text(
              "phone",
              style: TextStyle(
                  fontSize: height * 0.014,
                  fontWeight: FontWeight.w600,
                  color: AppColors.focus),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "9061166296",
              style: TextStyle(
                  fontSize: height * 0.02, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      )),
    );
  }
}
