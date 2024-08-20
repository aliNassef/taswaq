import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../models/product_model/product_model.dart';

class ProductRemoteSource {
  final ApiConsumer api;
  ProductRemoteSource({required this.api});

  Future<ProductModel> getProductsByCategory({required String category}) async {
    final response = await api.get(EndPoints.getProductsByCategory + category);

    return ProductModel.fromJson(response);
  }
}
