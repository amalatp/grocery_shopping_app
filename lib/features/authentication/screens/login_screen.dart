import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/Routes/routes_name.dart';
import 'package:grocery_shopping_app/configs/components/default_elevated_button.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    double width = context.mediaQueryWidth;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.17,
            ),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: height * 0.034, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              "Let’s Connect with Lorem Ipsum..!",
              style: TextStyle(fontSize: height * 0.015),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(
                      fontSize: height * 0.015,
                      color: AppColors.focus,
                      fontWeight: FontWeight.w400)),
              cursorColor: AppColors.focus,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            DefaultElevatedButton(
                onTap: () {
                  Navigator.of(context).pushNamed('/verify_otp');
                },
                buttonText: "Continue"),
            SizedBox(
              height: height * 0.035,
            ),
            Center(
              child: SizedBox(
                width: width * 0.6,
                child: Text(
                  "By Continuing you accepting the Terms of Use & Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: height * 0.012),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
