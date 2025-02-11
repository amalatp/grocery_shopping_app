import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/features/home/data/repository/home_repository.dart';
import 'package:grocery_shopping_app/features/home/models/banner_model.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final HomeRepository homeRepository;
  BannerBloc(this.homeRepository) : super(BannerInitial()) {
    on<FetchBanners>(_onFetchBanners);
  }

  Future<void> _onFetchBanners(
      FetchBanners event, Emitter<BannerState> emit) async {
    emit(BannerLoading());
    try {
      final banners = await homeRepository.getBanners();
      emit(BannerSuccess(banner: banners));
    } catch (e) {
      log("error from home bloc $e");
      emit(BannerError(message: "Failed to fetch banners: $e"));
    }
  }
}
