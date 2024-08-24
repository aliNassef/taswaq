import 'package:taswaq/core/api/end_ponits.dart';

import 'cart.dart';

class CartModel {
  List<Cart>? carts;
  int? total;
  int? skip;
  int? limit;

  CartModel({this.carts, this.total, this.skip, this.limit});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        carts: (json[ApiKey.carts] as List<dynamic>?)
            ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json[ApiKey.total] as int?,
        skip: json[ApiKey.skip] as int?,
        limit: json[ApiKey.limit] as int?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.carts: carts?.map((e) => e.toJson()).toList(),
        ApiKey.total: total,
        ApiKey.skip: skip,
        ApiKey.limit: limit,
      };
}
