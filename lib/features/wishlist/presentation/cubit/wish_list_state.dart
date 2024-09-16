part of 'wish_list_cubit.dart';

sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class WishListFailure extends WishListState {
  final String errMessage;

  WishListFailure({required this.errMessage});
}

final class WishListSuccess extends WishListState {
  final List<WishlistEntity> wishList;

  WishListSuccess({required this.wishList});
}

final class WishListLoading extends WishListState {}

final class WishListUpdated extends WishListState {}
