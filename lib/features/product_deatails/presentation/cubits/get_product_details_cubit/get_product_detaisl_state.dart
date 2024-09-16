part of 'get_product_detaisl_cubit.dart';

@immutable
sealed class GetProductDetailsState {}

final class GetProductDetaislInitial extends GetProductDetailsState {}

final class GetProductDetaislLoading extends GetProductDetailsState {}

final class GetProductDetaislLoaded extends GetProductDetailsState {
  final ProductDetailsEntity productDetailsEntity;

  GetProductDetaislLoaded({required this.productDetailsEntity});
}

final class GetProductDetaislFailure extends GetProductDetailsState {
  final String errMessage;

  GetProductDetaislFailure({required this.errMessage});
}

final class ToggleFavoriteInitial extends GetProductDetailsState {}

final class ToggleFavoriteSuccess extends GetProductDetailsState {}
