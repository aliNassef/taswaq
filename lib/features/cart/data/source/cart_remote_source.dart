import 'package:taswaq/features/cart/data/models/cart_model/cart.dart';
import 'package:taswaq/features/cart/data/models/cart_model/cart_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';

class CartRemoteSource {
  final ApiConsumer api;

  CartRemoteSource({required this.api});

  Future<List<Cart>> getUserCart({required String id}) async {
    final response = await api.get('${EndPoints.cartByUser}/$id');
    return CartModel.fromJson(response).carts ?? [];
  }
}
