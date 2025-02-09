import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: height * 0.055,
        width: height * 0.055,
        margin: EdgeInsets.symmetric(
          vertical: height * 0.05,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 11,
                  spreadRadius: 0,
                  offset: const Offset(0, 3))
            ]),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.focus,
          size: height * 0.03,
        ),
      ),
    );
  }
}
