import '../../../cart/domain/entities/cart_entity.dart';

class OrderEntity {
  final String id;
  final List<CartEntity> orders;
  final bool isReceived;

  OrderEntity({
    required this.id,
    required this.orders,
    this.isReceived = false,
  });

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      id: map['id'] ?? '',
      orders: List<CartEntity>.from(
        map['orders'].map<CartEntity>(
          (x) => CartEntity.fromJson(x),
        ),
      ),
      isReceived: map['isReceived'] ?? false,
    );
  }

  toMap() {
    return {
      'id': id,
      'orders': orders.map((x) => x.toJson()).toList(),
      'isReceived': isReceived,
    };
  }
}
