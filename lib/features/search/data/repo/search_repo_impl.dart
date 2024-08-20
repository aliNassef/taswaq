import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/exceptions.dart';

import 'package:taswaq/core/errors/failure.dart';

import 'package:taswaq/features/search/domain/entities/search_entity/search_entity.dart';

import '../../domain/repo/search_repo.dart';
import '../source/search_remote_source.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteSource _searchRemoteSource;

  SearchRepoImpl(this._searchRemoteSource);

 
  @override
  Future<Either<Failure, List<SearchEntity>>> getSearchResults(
      {required String query}) async {
    try {
      final response = await _searchRemoteSource.getSearchResults(query: query);
      return Right(response.products as List<SearchEntity>);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
