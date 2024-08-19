import 'package:taswaq/features/products/domain/entities/product_entity/product_entity.dart';

class GetProductsByCategoryState {}

final class GetproductsbycategoryInitial extends GetProductsByCategoryState {}

final class GetproductsbycategoryLoaded extends GetProductsByCategoryState {
  final List<ProductEntity> products;

  GetproductsbycategoryLoaded({required this.products});
}

final class GetproductsbycategoryFailure extends GetProductsByCategoryState {
  final String errMessage;

  GetproductsbycategoryFailure({required this.errMessage});
}

final class GetproductsbycategoryLoading extends GetProductsByCategoryState {}
