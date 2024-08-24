import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';

import 'product.dart';

class Cart extends CartEntity {
  int? id;
  int? userId;

  int? totalQuantity;

  Cart({
    this.id,
    super.products,
    super.total,
    super.discountedTotal,
    this.userId,
    super.totalProducts,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json[ApiKey.id] as int?,
        products: (json[ApiKey.products] as List<dynamic>?)
            ?.map((e) => ProductCart.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: (json[ApiKey.total] as num?)?.toDouble(),
        discountedTotal: (json[ApiKey.discountedTotal] as num?)?.toDouble(),
        userId: json[ApiKey.userId] as int?,
        totalProducts: json[ApiKey.totalProducts] as int?,
        totalQuantity: json[ApiKey.totalQuantity] as int?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.products: products?.map((e) => e.toJson()).toList(),
        ApiKey.total: total,
        ApiKey.discountedTotal: discountedTotal,
        ApiKey.userId: userId,
        ApiKey.totalProducts: totalProducts,
        ApiKey.totalQuantity: totalQuantity,
      };
}
