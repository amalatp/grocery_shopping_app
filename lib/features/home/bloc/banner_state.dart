part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<BannerModel> banner;

  BannerSuccess({required this.banner});
}

class BannerError extends BannerState {
  final String message;

  BannerError({required this.message});
}
