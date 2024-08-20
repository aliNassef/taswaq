import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/search/domain/entities/search_entity/search_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchEntity>>> getSearchResults(
      {required String query});
}
