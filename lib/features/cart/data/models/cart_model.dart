import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.title,
    required super.image,
    required super.price,
    required super.quantity,
    required super.productId,
    required super.discountPercentage,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      title: json[ApiKey.title],
      image: json[ApiKey.image],
      price: json[ApiKey.price],
      quantity: json[ApiKey.quantity],
      productId: json[ApiKey.id],
      discountPercentage: json[ApiKey.discountPercentage],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ApiKey.title: title,
        ApiKey.image: image,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.id: productId,
        ApiKey.discountPercentage: discountPercentage
      };
}
