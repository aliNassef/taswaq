import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/shared/functions/get_user_data.dart';
import '../source/wishlist_remote_source.dart';
import '../../domain/entity/wishlisst_entity.dart';
import '../../domain/repo/wishlist_repo.dart';

class WishlistRepoImpl extends WishlistRepo {
  final WishlistRemoteSource wishlistRemoteSource;
  WishlistRepoImpl({required this.wishlistRemoteSource});
  @override
  Future<void> addProductToCart({
    required WishlistEntity product,
    required String id,
  }) async {
    await wishlistRemoteSource.addProduct(item: product, id: id);
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
        id: getUserData().id!,
      );
      return Right(data);
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
