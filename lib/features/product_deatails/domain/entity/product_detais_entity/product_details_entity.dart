import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/product_deatails/domain/entity/sub_entities/review_entity.dart';

class ProductDetailsEntity {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final List<String>? images;
  final List<String>? tags;
  final double? discountPercentage;
  final double? rating;
  // revies not list of string it list of review entity
  final List<dynamic>? reviews;

  const ProductDetailsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.tags,
    required this.discountPercentage,
    required this.rating,
    required this.reviews,
  });

  factory ProductDetailsEntity.fromJson(Map<String, dynamic> json) {
    return ProductDetailsEntity(
      id: json[ApiKey.id] as int?,
      title: json[ApiKey.title] as String?,
      description: json[ApiKey.description] as String?,
      price: json[ApiKey.price] as double?,
      images: (json[ApiKey.images] as List<dynamic>).cast<String>(),
      tags: (json[ApiKey.tags] as List<dynamic>).cast<String>(),
      discountPercentage: json[ApiKey.discountPercentage] as double?,
      rating: json[ApiKey.rating] as double?,
      reviews: json[ApiKey.reviews] == null
          ? null
          : (json[ApiKey.reviews] as List<dynamic>)
              .map((e) => ReviewsEntity.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.title: title,
      ApiKey.description: description,
      ApiKey.price: price,
      ApiKey.images: images,
      ApiKey.tags: tags,
      ApiKey.discountPercentage: discountPercentage,
      ApiKey.rating: rating,
      ApiKey.reviews: reviews,
    };
  }
}
