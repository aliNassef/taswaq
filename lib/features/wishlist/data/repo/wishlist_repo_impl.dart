import 'package:dartz/dartz.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/wishlist/data/model/wishlist_model.dart';
import 'package:taswaq/features/wishlist/data/source/wishlist_remote_source.dart';
import 'package:taswaq/features/wishlist/domain/entity/wishlisst_entity.dart';
import 'package:taswaq/features/wishlist/domain/repo/wishlist_repo.dart';

class WishlistRepoImpl extends WishlistRepo {
  final WishlistRemoteSource wishlistRemoteSource;
  WishlistRepoImpl({required this.wishlistRemoteSource});
  @override
  Future<void> addProductToCart({
    required WishlistModel product,
    required String userId,
  }) async {
    await wishlistRemoteSource.addProduct(item: product);
  }

  @override
  Future<void> deleteItemFromWishList({
    required String id,
  }) async {
    await wishlistRemoteSource.deleteProduct(id: id);
  }

  @override
  Future<Either<Failure, List<WishlistEntity>>> getWishListItems() async {
    try {
      var data = await wishlistRemoteSource.getData(
          id: getIt<CacheHelper>().getData(key: ApiKey.userId));
      return Right(data);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
