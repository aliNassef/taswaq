import 'package:taswaq/core/api/end_ponits.dart';

class CartEntity {
  final String title;
  final String image;
  final double price;
  final int quantity;
  final int productId;
  final double discountPercentage;

  CartEntity({
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
    required this.discountPercentage,
  });

  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(
      title: json[ApiKey.title],
      image: json[ApiKey.image],
      price: json[ApiKey.price],
      quantity: json[ApiKey.quantity],
      productId: json[ApiKey.id],
      discountPercentage: json[ApiKey.discountPercentage],
    );
  }

  toJson() => {
        ApiKey.title: title,
        ApiKey.image: image,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.id: productId,
        ApiKey.discountPercentage: discountPercentage
      };
}
