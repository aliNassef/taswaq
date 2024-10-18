import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/cart/data/models/cart_model.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';
import 'package:taswaq/features/checkout/data/model/address_model.dart';

class OrderModel {
  final String id;
  final List<CartEntity> orders;
  final bool isRecived;
  final AddressModel address;
  final num totalPrice;

  OrderModel({
    required this.id,
    required this.orders,
    required this.isRecived,
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
      isRecived: map[ApiKey.isRecived],
      totalPrice: map[ApiKey.total],
      address: AddressModel.fromMap(map[ApiKey.address]),
    );
  }
}
