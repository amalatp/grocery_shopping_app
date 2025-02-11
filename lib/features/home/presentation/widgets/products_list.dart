import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/configs/constants/app_svg.dart';
import 'package:grocery_shopping_app/configs/extension/mediaquery_extension.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';
import 'package:grocery_shopping_app/features/home/bloc/product_bloc.dart';
import 'package:svg_flutter/svg.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.mediaQueryHeight;
    double width = context.mediaQueryWidth;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const CircularProgressIndicator();
        } else if (state is ProductSuccess) {
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
                      child:
                          (product.images != null && product.images!.isNotEmpty)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: product.images![0].toString(),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.image_not_supported),
                                  ),
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
        } else if (state is ProductError) {
          return const Text("Something went wrong");
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
