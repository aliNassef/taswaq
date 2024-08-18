class ProductEntity {
  final String? title;
  final String? thumbnail;
  final num? price;
  final num? discountPercentage;

  const ProductEntity({
      this.discountPercentage,
      this.title,
      this.thumbnail,
      this.price,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'discountPercentage': discountPercentage,
    };
  }
}
