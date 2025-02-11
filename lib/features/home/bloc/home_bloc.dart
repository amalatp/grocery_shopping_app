import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping_app/features/home/data/repository/home_repository.dart';
import 'package:grocery_shopping_app/features/home/models/pduct_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final products = await homeRepository.getProductList();
      emit(FetchProductSuccess(products: products));
    } catch (e) {
      log("error from home bloc $e");
      emit(HomeError(message: "Failed to fetch products: $e"));
    }
  }
}
