import 'package:taswaq/core/api/end_ponits.dart';

class ProductCart {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  ProductCart({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) => ProductCart(
        id: json[ApiKey.id] as int?,
        title: json[ApiKey.title] as String?,
        price: (json[ApiKey.price] as num?)?.toDouble(),
        quantity: json[ApiKey.quantity] as int?,
        total: (json[ApiKey.total] as num?)?.toDouble(),
        discountPercentage:
            (json[ApiKey.discountPercentage] as num?)?.toDouble(),
        discountedTotal: (json[ApiKey.discountedTotal] as num?)?.toDouble(),
        thumbnail: json[ApiKey.thumbnail] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.title: title,
        ApiKey.price: price,
        ApiKey.quantity: quantity,
        ApiKey.total: total,
        ApiKey.discountPercentage: discountPercentage,
        ApiKey.discountedTotal: discountedTotal,
        ApiKey.thumbnail: thumbnail,
      };
}
