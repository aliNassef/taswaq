import 'package:taswaq/core/api/api_consumer.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/features/products/data/models/product_model/product_model.dart';

class ProductRemoteSource {
  final ApiConsumer api;
  ProductRemoteSource({required this.api});

  Future<ProductModel> getProductsByCategory({required String category}) async {
    final response = await api.get(EndPoints.getProductsByCategory + category);

    return ProductModel.fromJson(response);
  }
}
