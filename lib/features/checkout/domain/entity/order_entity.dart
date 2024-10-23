import '../../../profile/domain/entity/address_entity.dart';

import '../../../cart/domain/entities/cart_entity.dart';
import '../../data/model/address_model.dart';
 
class OrderEntity {
  final String id;
  final List<CartEntity> orders;
  final bool isRecived;
  final AddressEntity address;
  final num totalPrice;

  OrderEntity({
    required this.id,
    required this.orders,
    required this.isRecived,
    required this.address,
    required this.totalPrice,
  });

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      id: map['id'] ?? '',
      orders: List<CartEntity>.from(
        map['orders'].map<CartEntity>(
          (x) => CartEntity.fromJson(x),
        ),
      ),
      isRecived: map['isRecived'] ?? false,
      address: AddressModel.fromMap(map['address']),
      totalPrice: map['totalPrice'] ?? 0,
    );
  }
 
 toMap() {
    return {
      'id': id,
      'orders': orders.map((x) => x.toJson()).toList(),
      'isRecived': isRecived,
      'address': address.toMap(),
      'totalPrice': totalPrice,
    };
  }
}
