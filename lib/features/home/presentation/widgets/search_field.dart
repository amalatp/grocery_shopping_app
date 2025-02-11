import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(116, 116, 116, 0.15),
                blurRadius: 25,
                spreadRadius: 0,
                offset: Offset(0, 4))
          ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'search',
          hintStyle:
              TextStyle(color: AppColors.focus, fontSize: height * 0.016),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.focus,
            size: height * 0.025,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        cursorColor: AppColors.focus,
      ),
    );
  }
}
