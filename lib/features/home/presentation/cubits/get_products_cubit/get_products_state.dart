part of 'get_products_cubit.dart';

class GetProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetProductsInitial extends GetProductsState {

  @override
  List<Object?> get props => [];
}

final class GetProductsLoading extends GetProductsState {

  @override
  List<Object?> get props => [];
}

final class GetProductsLoaded extends GetProductsState {
  final List<ProductEntity> productList;

  GetProductsLoaded({required this.productList});

  @override
  List<Object?> get props => [productList];
}

final class GetProductsFailure extends GetProductsState {
  final String errMessage;

  GetProductsFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}
