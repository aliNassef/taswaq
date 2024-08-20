import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/search_entity/search_entity.dart';
import '../../../domain/repo/search_repo.dart';

part 'get_search_result_state.dart';

class GetSearchResultCubit extends Cubit<GetSearchResultState> {
  GetSearchResultCubit(this._searchRepo) : super(GetSearchResultInitial());
  final SearchRepo _searchRepo;
  TextEditingController searchController = TextEditingController();
  Future<void> getSearchResults({required String query}) async {
    emit(GetSearchResultLoading());
    final response = await _searchRepo.getSearchResults(query: query);
    response.fold(
      (failure) => emit(
        GetSearchResultFailure(errMessage: failure.errMessage),
      ),
      (products) => emit(
        GetSearchResultLoaded(products: products),
      ),
    );
  }
}
