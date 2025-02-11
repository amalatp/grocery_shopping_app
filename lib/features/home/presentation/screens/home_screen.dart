import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/features/home/bloc/banner_bloc.dart';
import 'package:grocery_shopping_app/features/home/bloc/product_bloc.dart';
import 'package:grocery_shopping_app/features/home/presentation/widgets/banner.dart';
import 'package:grocery_shopping_app/features/home/presentation/widgets/products_list.dart';
import 'package:grocery_shopping_app/features/home/presentation/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(FetchProducts());
    context.read<BannerBloc>().add(FetchBanners());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            SearchField(height: height),
            SizedBox(height: height * 0.03),
            const BannerWidget(),
            SizedBox(height: height * 0.03),
            Text(
              "Popular Products",
              style: TextStyle(
                  fontSize: height * 0.018, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height * 0.02),
            const ProductsListWidget(),
            SizedBox(
              height: height * 0.07,
            )
          ],
        ),
      ),
    )));
  }
}
