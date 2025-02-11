part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class FetchProductSuccess extends HomeState {
  final List<ProductModel> products;

  FetchProductSuccess({required this.products});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
