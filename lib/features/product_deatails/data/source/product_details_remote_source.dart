import 'package:taswaq/core/api/api_consumer.dart';
import 'package:taswaq/features/product_deatails/data/models/product_detsails_mode/product_details_model.dart';

import '../../../../core/api/end_ponits.dart';

class ProductDetailsRemoteSource {
  final ApiConsumer api;

  ProductDetailsRemoteSource({required this.api});
  Future<ProductDetailsModel> getProductDetailsById({required int id}) async {
    final response = await api.get('${EndPoints.products}/${id.toString()}');

    return ProductDetailsModel.fromJson(response);
  }
}
