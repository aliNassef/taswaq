part of 'get_products_cubit.dart';

class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsLoaded extends GetProductsState {
  final List<ProductEntity> productList;

  GetProductsLoaded({required this.productList});
}

final class GetProductsFailure extends GetProductsState {
  final String errMessage;

  GetProductsFailure({required this.errMessage});
}
