import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../models/product_model/product_model.dart';

class HomeRemoteSource {
  final ApiConsumer api;

  const HomeRemoteSource({required this.api});
  Future<ProductModel> getProducts() async {
    final response = await api.get(EndPoints.products);

    return ProductModel.fromJson(response);
  }

  Future<List<String>> getCategories() async {
    final response = await api.get(EndPoints.categories);
    return List<String>.from(response);
  }
}
