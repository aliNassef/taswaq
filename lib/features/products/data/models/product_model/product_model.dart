import 'package:taswaq/core/api/end_ponits.dart';

import '../sub_models/product.dart';

class ProductModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductModel({this.products, this.total, this.skip, this.limit});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: (json[ApiKey.products] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json[ApiKey.total] as int?,
        skip: json[ApiKey.skip] as int?,
        limit: json[ApiKey.limit] as int?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.products: products?.map((e) => e.toJson()).toList(),
        ApiKey.total: total,
        ApiKey.skip: skip,
        ApiKey.limit: limit,
      };
}
