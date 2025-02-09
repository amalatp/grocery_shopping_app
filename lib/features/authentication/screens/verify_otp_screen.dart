import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/components/default_app_bar.dart';
import 'package:grocery_shopping_app/configs/components/default_elevated_button.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    double width = context.mediaQueryWidth;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultAppBar(),
            Text(
              "OTP VERIFICATION",
              style: TextStyle(
                  fontSize: height * 0.019, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Text(
              "Enter the OTP sent to - +91-8976500001",
              style: TextStyle(fontSize: height * 0.015),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "OTP is ",
              style: TextStyle(
                  fontSize: height * 0.019, fontWeight: FontWeight.w700),
            ),
            RichText(
              text: TextSpan(
                  text: "Don’t receive code ? ",
                  style: TextStyle(
                      fontSize: height * 0.015, color: AppColors.focus),
                  children: const [
                    TextSpan(
                        text: "Re-send", style: TextStyle(color: Colors.green))
                  ]),
            ),
            DefaultElevatedButton(
                onTap: () {
                  Navigator.of(context).pushNamed('/new_user');
                },
                buttonText: "Submit")
          ],
        ),
      ),
    ));
  }
}
