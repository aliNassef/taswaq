import '../../../cart/domain/entities/cart_entity.dart';

class OrderEntity {
  final String id;
  final List<CartEntity> orders;

  OrderEntity({
    required this.id,
    required this.orders,
  });

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      id: map['id'] ?? '',
      orders: List<CartEntity>.from(
        map['orders'].map<CartEntity>(
          (x) => CartEntity.fromJson(x),
        ),
      ),
    );
  }

  toMap() {
    return {
      'id': id,
      'orders': orders.map((x) => x.toJson()).toList(),
    };
  }
}
