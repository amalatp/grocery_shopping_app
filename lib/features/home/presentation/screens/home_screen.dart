import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/configs/constants/app_svg.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';
import 'package:grocery_shopping_app/features/home/bloc/home_bloc.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    double width = context.mediaQueryWidth;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                  hintStyle: TextStyle(
                      color: AppColors.focus, fontSize: height * 0.016),
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
            ),
            SizedBox(height: height * 0.03),
            Text(
              "Popular Products",
              style: TextStyle(
                  fontSize: height * 0.018, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height * 0.02),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const CircularProgressIndicator();
                } else if (state is FetchProductSuccess) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .72,
                        crossAxisSpacing: width * 0.05,
                        mainAxisSpacing: height * 0.04,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products.elementAt(index);
                        bool isDiscount = product.mrp > product.salePrice;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: width * 0.46,
                              decoration: BoxDecoration(
                                  color: AppColors.focus,
                                  borderRadius: BorderRadius.circular(20)),
                              child: (product.images != null &&
                                      product.images!.isNotEmpty)
                                  ? CachedNetworkImage(
                                      imageUrl: product.images![0].toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.image_not_supported),
                                    )
                                  : const Icon(Icons.image_not_supported),
                            ),
                            Row(
                              children: [
                                if (isDiscount)
                                  Text(
                                    " ${product.mrp} ",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: AppColors.focus,
                                        decorationThickness: 3,
                                        color: AppColors.focus,
                                        fontSize: height * 0.014,
                                        fontWeight: FontWeight.w600),
                                  ),
                                Text(
                                  " ₹${product.salePrice}",
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: height * 0.016,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  AppSvg.star,
                                  height: height * 0.016,
                                ),
                                Text(
                                  " ${product.rating}",
                                  style: TextStyle(
                                    fontSize: height * 0.014,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: height * 0.016,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        );
                      });
                } else if (state is HomeError) {
                  return Text("Something went wrong");
                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(
              height: height * 0.07,
            )
          ],
        ),
      ),
    )));
  }
}
