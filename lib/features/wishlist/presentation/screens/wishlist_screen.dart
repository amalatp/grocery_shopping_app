import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            Text(
              "Wishlist",
              style: TextStyle(
                  fontSize: height * 0.02, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      )),
    );
  }
}
