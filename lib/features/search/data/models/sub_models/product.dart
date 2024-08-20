import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/search/domain/entities/search_entity/search_entity.dart';

import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';

class Product extends SearchEntity {
  int? id;
  String? description;
  String? category;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;

  Product({
    this.id,
    super.title,
    this.description,
    this.category,
    super.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    super.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json[ApiKey.id] as int?,
        title: json[ApiKey.title] as String,
        description: json[ApiKey.description] as String?,
        category: json[ApiKey.category] as String?,
        price: (json[ApiKey.price] as num).toDouble(),
        discountPercentage: (json[ApiKey.discountPercentage] as num).toDouble(),
        rating: (json[ApiKey.rating] as num?)?.toDouble(),
        stock: json[ApiKey.stock] as int?,
        tags: (json[ApiKey.tags] as List<dynamic>).cast<String>(),
        brand: json[ApiKey.brand] as String?,
        sku: json[ApiKey.sku] as String?,
        weight: json[ApiKey.weight] as int?,
        dimensions: json[ApiKey.dimensions] == null
            ? null
            : Dimensions.fromJson(
                json[ApiKey.dimensions] as Map<String, dynamic>),
        warrantyInformation: json[ApiKey.warrantyInformation] as String?,
        shippingInformation: json[ApiKey.shippingInformation] as String?,
        availabilityStatus: json[ApiKey.availabilityStatus] as String?,
        reviews: (json[ApiKey.reviews] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        returnPolicy: json[ApiKey.returnPolicy] as String?,
        minimumOrderQuantity: json[ApiKey.minimumOrderQuantity] as int?,
        meta: json[ApiKey.meta] == null
            ? null
            : Meta.fromJson(json[ApiKey.meta] as Map<String, dynamic>),
        images: (json[ApiKey.images] as List<dynamic>).cast<String>(),
        thumbnail: json[ApiKey.thumbnail] as String,
      );
  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.title: title,
        ApiKey.description: description,
        ApiKey.category: category,
        ApiKey.price: price,
        ApiKey.discountPercentage: discountPercentage,
        ApiKey.rating: rating,
        ApiKey.stock: stock,
        ApiKey.tags: tags,
        ApiKey.brand: brand,
        ApiKey.sku: sku,
        ApiKey.weight: weight,
        ApiKey.dimensions: dimensions?.toJson(),
        ApiKey.warrantyInformation: warrantyInformation,
        ApiKey.shippingInformation: shippingInformation,
        ApiKey.availabilityStatus: availabilityStatus,
        ApiKey.reviews: reviews?.map((e) => e.toJson()).toList(),
        ApiKey.returnPolicy: returnPolicy,
        ApiKey.minimumOrderQuantity: minimumOrderQuantity,
        ApiKey.meta: meta?.toJson(),
        ApiKey.images: images,
        ApiKey.thumbnail: thumbnail,
      };
}
