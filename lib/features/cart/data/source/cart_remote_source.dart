import 'package:taswaq/features/cart/data/models/cart_model.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';

class CartRemoteSource {
  final ApiConsumer api;

  CartRemoteSource({required this.api});

  Future<List<CartModel>> getUserCart({required String id}) async {
    final response = await api.get('${EndPoints.carts}/$id');
    return List<CartModel>.from(response.map((x) => CartModel.fromJson(x)));
  }
}
