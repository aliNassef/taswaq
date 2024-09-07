import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  final String userId;
  CartModel({
    required this.userId,
    required super.title,
    required super.image,
    required super.price,
    required super.quantity,
    required super.productId,
    required super.discountPercentage,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      userId: json['userId'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      productId: json['productId'],
      discountPercentage: json['discountPercentage'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "image": image,
        "price": price,
        "quantity": quantity,
        "productId": productId,
        "discountPercentage": discountPercentage
      };
}
