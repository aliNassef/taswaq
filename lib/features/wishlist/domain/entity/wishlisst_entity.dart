import 'package:taswaq/core/api/end_ponits.dart';

class WishlistEntity {
  final String title;
  final double price;
  final double discountPercentage;
  final String image;
  final int productId;

  WishlistEntity({
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.image,
    required this.productId,
  });

  factory WishlistEntity.fromMap(data) {
    return WishlistEntity(
      title: data[ApiKey.title],
      price: data[ApiKey.price],
      discountPercentage: data[ApiKey.discountPercentage],
      image: data[ApiKey.image],
      productId: data[ApiKey.id],
    );
  }
  toMap() => {
        ApiKey.title: title,
        ApiKey.price: price,
        ApiKey.discountPercentage: discountPercentage,
        ApiKey.image: image,
        ApiKey.id: productId,
      };
}
