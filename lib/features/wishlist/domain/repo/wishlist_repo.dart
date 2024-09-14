import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/wishlist/data/model/wishlist_model.dart';
import 'package:taswaq/features/wishlist/domain/entity/wishlisst_entity.dart';

abstract class WishlistRepo {
  Future<Either<Failure, List<WishlistEntity>>> getWishListItems();
  Future<void> deleteItemFromWishList({required String id});
  Future<void> addProductToCart({
    required WishlistModel product,
    required String userId,
  });
}
