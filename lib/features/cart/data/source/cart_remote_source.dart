import 'package:taswaq/core/services/database_service.dart';
import 'package:taswaq/features/cart/data/models/cart_model.dart';
import '../../../../core/api/end_ponits.dart';

class CartRemoteSource {
  final DatabaseService databaseService;
  CartRemoteSource({required this.databaseService});

  Stream<List<CartModel>> getUserCart({required String id}) {
    final response = databaseService.getSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.carts,
      docId: id,
    );

    return response
        .map((data) => data.map((e) => CartModel.fromJson(e)).toList());
  }
}
