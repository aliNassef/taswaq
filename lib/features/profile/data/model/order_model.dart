import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/cart/data/models/cart_model.dart';
import 'package:taswaq/features/checkout/data/model/address_model.dart';

import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  final double totalPrice;
  final AddressModel address;

  OrderModel({
    required super.id,
    required super.orders,
    required super.isReceived,
    required this.totalPrice,
    required this.address,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map[ApiKey.id],
      orders: List<CartModel>.from(
        map[ApiKey.orders].map(
          (x) => CartModel.fromJson(x),
        ),
      ),
      isReceived: map[ApiKey.isRecived],
      totalPrice: map[ApiKey.total],
      address: AddressModel.fromMap(map[ApiKey.address]),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ApiKey.id: id,
      ApiKey.orders: orders.map((x) => x.toJson()).toList(),
      ApiKey.isRecived: isReceived,
      ApiKey.total: totalPrice,
      ApiKey.address: address.toMap(),
    };
  }
}
