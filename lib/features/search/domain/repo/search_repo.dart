import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/search_entity/search_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchEntity>>> getSearchResults(
      {required String query});
}
