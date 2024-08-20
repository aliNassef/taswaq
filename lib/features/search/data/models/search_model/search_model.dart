import '../../../../../core/api/end_ponits.dart';
import '../sub_models/product.dart';

class SearchModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;
  SearchModel({this.products, this.total, this.skip, this.limit});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        products: (json[ApiKey.products] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json[ApiKey.total] as int?,
        skip: json[ApiKey.skip] as int?,
        limit: json[ApiKey.limit] as int?,
      );
}
