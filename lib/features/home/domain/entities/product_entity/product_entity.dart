import 'package:taswaq/core/api/end_ponits.dart';

class ProductEntity {
  final String? title;
  final String? thumbnail;
  final num? price;
  final num? discountPercentage;
  final int? id;

  const ProductEntity({
    this.id,
    this.discountPercentage,
    this.title,
    this.thumbnail,
    this.price,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json[ApiKey.id],
      title: json[ApiKey.title],
      thumbnail: json[ApiKey.thumbnail],
      price: json[ApiKey.price],
      discountPercentage: json[ApiKey.discountPercentage],
    );
  }

  Map<String, dynamic> toJson() {
    return {
       ApiKey.id: id,
      ApiKey.title: title,
      ApiKey.thumbnail: thumbnail,
      ApiKey.price: price,
      ApiKey.discountPercentage: discountPercentage,
    };
  }
}
