import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          SizedBox(height: height * 0.03),
          TextField(
            decoration: InputDecoration(
              hintText: 'search',
              suffixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            ),
            cursorColor: AppColors.focus,
          ),
          SizedBox(height: height * 0.03),
          Text(
            "Popular Products",
            style: TextStyle(
                fontSize: height * 0.018, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: height * 0.02),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .72,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.04,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: width * 0.46,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Row(
                      children: [
                        Text(
                          " Price ",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.focus,
                              decorationThickness: 3,
                              color: AppColors.focus,
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " Price",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: height * 0.016,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: height * 0.014,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Product Name",
                      style: TextStyle(
                          fontSize: height * 0.016,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                );
              })
        ],
      ),
    )));
  }
}
