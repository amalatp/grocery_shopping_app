import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/components/default_app_bar.dart';
import 'package:grocery_shopping_app/configs/components/default_elevated_button.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class NewUserScreen extends StatelessWidget {
  const NewUserScreen({super.key});

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
            const DefaultAppBar(),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter Full Name",
                  hintStyle: TextStyle(
                      fontSize: height * 0.015,
                      color: AppColors.focus,
                      fontWeight: FontWeight.w400)),
              cursorColor: AppColors.focus,
            ),
            DefaultElevatedButton(onTap: () {}, buttonText: "Submit")
          ],
        ),
      )),
    );
  }
}
