import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
 import '../entity/wishlisst_entity.dart';

abstract class WishlistRepo {
  Future<Either<Failure, List<WishlistEntity>>> getWishListItems();
  Future<void> deleteItemFromWishList({required String id});
  Future<void> addProductToCart({
    required WishlistEntity product,
    required String id,
  });
}
