import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repo/wishlist_repo.dart';

import '../../domain/entity/wishlisst_entity.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(this.wishListRepo) : super(WishListInitial());
  final WishlistRepo wishListRepo;
  Future<void> getWishListData() async {
    emit(WishListLoading());
    final data = await wishListRepo.getWishListItems();
    data.fold(
      (error) => emit(WishListFailure(
        errMessage: error.toString(),
      )),
      (items) => emit(
        WishListSuccess(wishList: items),
      ),
    );
  }

  Future<void> deleteProductFromWishList({required String id}) async {
    await wishListRepo.deleteItemFromWishList(id: id);
    emit(WishListUpdated());
  }

  Future<void> addProductToCart({required WishlistEntity product}) async {
    await wishListRepo.addProductToCart(
      product: product,
      id: product.productId.toString(),
    );
    emit(AddedToCartState());
  }
}
