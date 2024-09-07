 
class CartEntity {
  final String title;
  final String image;
  final double price;
  final int quantity;
  final String productId;
  final String discountPercentage;

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
      title: json['title'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      productId: json['productId'],
      discountPercentage: json['discountPercentage'],
    );
  }

  toJson() => {
        "title": title,
        "image": image,
        "price": price,
        "quantity": quantity,
        "productId": productId,
        "discountPercentage": discountPercentage
      };
}
