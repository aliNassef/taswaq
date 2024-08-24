import '../../../../../core/api/end_ponits.dart';
import '../../../domain/entity/product_detais_entity/product_details_entity.dart';
import '../sub_models/dimension_model.dart';
import '../sub_models/meta_model.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  String? category;
  int? stock;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;

  ProductDetailsModel({
    super.id,
    super.title,
    super.description,
    super.price,
    super.images,
    super.tags,
    super.discountPercentage,
    super.rating,
    super.reviews,
    this.availabilityStatus,
    this.category,
    this.dimensions,
    this.minimumOrderQuantity,
    this.meta,
    this.brand,
    this.sku,
    this.shippingInformation,
    this.stock,
    this.weight,
    this.warrantyInformation,
    this.returnPolicy,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json[ApiKey.id] as int?,
      title: json[ApiKey.title] as String?,
      description: json[ApiKey.description] as String?,
      price: json[ApiKey.price] as double?,
      images: (json[ApiKey.images] as List<dynamic>).cast<String>(),
      tags: (json[ApiKey.tags] as List<dynamic>).cast<String>(),
      discountPercentage: json[ApiKey.discountPercentage] as double?,
      rating: json[ApiKey.rating] as double?,
      reviews: json[ApiKey.reviews],
      availabilityStatus: json[ApiKey.availabilityStatus] as String?,
      category: json[ApiKey.category] as String?,
      dimensions: json[ApiKey.dimensions] != null
          ? Dimensions.fromJson(json[ApiKey.dimensions])
          : null,
      minimumOrderQuantity: json[ApiKey.minimumOrderQuantity],
      meta: json[ApiKey.meta] != null ? Meta.fromJson(json[ApiKey.meta]) : null,
      brand: json[ApiKey.brand] as String?,
      sku: json[ApiKey.sku] as String?,
      shippingInformation: json[ApiKey.shippingInformation] as String?,
      stock: json[ApiKey.stock] as int?,
      weight: json[ApiKey.weight] as int?,
      warrantyInformation: json[ApiKey.warrantyInformation] as String?,
      returnPolicy: json[ApiKey.returnPolicy] as String?,
    );
  }
}
