import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/configs/theme/app_colors.dart';
import 'package:grocery_shopping_app/features/home/bloc/banner_bloc.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        log("banner state is $state");
        if (state is BannerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BannerSuccess) {
          return CarouselSlider.builder(
            itemCount: state.banner.length,
            itemBuilder: (context, index, realIndex) {
              final banner = state.banner.elementAt(index);
              log(banner.imageUrl);
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.focus),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: banner.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 2,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          );
        } else if (state is BannerError) {
          return const Text("Something went wrong");
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
