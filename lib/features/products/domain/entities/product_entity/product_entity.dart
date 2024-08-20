import '../../../../../core/api/end_ponits.dart';

class ProductEntity {
  final String? title;
  final String? thumbnail;

  const ProductEntity({required this.title, required this.thumbnail});

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      title: json[ApiKey.title] as String?,
      thumbnail: json[ApiKey.thumbnail] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.title: title,
      ApiKey.thumbnail: thumbnail,
    };
  }
}
