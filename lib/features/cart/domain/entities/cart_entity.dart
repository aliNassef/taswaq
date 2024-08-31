import 'package:taswaq/core/api/end_ponits.dart';

import '../../data/models/cart_model/product.dart';

class CartEntity {
  final List<ProductCart>? products;
  final double? total;
  final double? discountedTotal;
  final int? totalProducts;

  const CartEntity({
    this.products,
    this.total,
    this.discountedTotal,
    this.totalProducts,
  });

  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(
      products: json[ApiKey.products],
      total: json[ApiKey.total],
      discountedTotal: json[ApiKey.discountedTotal],
      totalProducts: json[ApiKey.totalProducts],
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKey.products: products?.map((e) => e.toJson()).toList(), 
        ApiKey.total: total,
        ApiKey.discountedTotal: discountedTotal,
        ApiKey.totalProducts: totalProducts,  
      };

}
/*
  userId
  productId
  quantity
  title
  price
  total
  discountedTotal
  discountPercentage
 */