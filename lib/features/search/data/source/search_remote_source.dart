import '../../../../core/api/api_consumer.dart';
import '../models/search_model/search_model.dart';

import '../../../../core/api/end_ponits.dart';

class SearchRemoteSource {
  final ApiConsumer api;

  SearchRemoteSource({required this.api});

  Future<SearchModel> getSearchResults({required String query}) async {
    final response = await api.get(EndPoints.search + query);
    return SearchModel.fromJson(response);
  }
}
