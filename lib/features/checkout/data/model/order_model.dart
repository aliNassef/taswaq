import '../../../../core/api/end_ponits.dart';
import '../../../cart/data/models/cart_model.dart';
import 'address_model.dart';

import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.orders,
    required super.isRecived,
    required super.totalPrice,
    required super.address,
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

  factory OrderModel.fromEntity(OrderEntity entity){
    return OrderModel(
      id: entity.id,
      orders: entity.orders,
      isRecived: entity.isRecived,
      totalPrice: entity.totalPrice,
      address: entity.address,
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      ApiKey.id: id,
      ApiKey.orders: orders.map((x) => x.toJson()).toList(),
      ApiKey.isRecived: isRecived,
      ApiKey.total: totalPrice,
      ApiKey.address: address.toMap(),
    };
  }
}
