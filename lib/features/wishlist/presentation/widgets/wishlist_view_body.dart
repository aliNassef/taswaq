import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../domain/entity/wishlisst_entity.dart';
import 'empty_wishlist.dart';
import 'wish_item.dart';
import '../cubit/wish_list_cubit.dart';
import '../../../../core/shared/widgets/spacers.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WishListCubit>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.black,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              await cubit.getWishListData();
            },
            child: BlocConsumer<WishListCubit, WishListState>(
              listener: (context, state) {},
              buildWhen: (previous, current) =>
                  current is WishListSuccess ||
                  current is WishListFailure ||
                  current is WishListLoading,
              builder: (context, state) {
                if (state is WishListSuccess) {
                  return state.wishList.isEmpty
                      ? const EmptyWishList()
                      : ListView.separated(
                          itemBuilder: (context, index) => WishItem(
                            instance: state.wishList[index],
                          ),
                          itemCount: state.wishList.length,
                          separatorBuilder: (context, index) =>
                              const VerticalSpace(10),
                        );
                } else if (state is WishListFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  return Skeletonizer(
                    enabled: true,
                    child: ListView.separated(
                      itemBuilder: (context, index) => WishItem(
                        instance: dumyData[index],
                      ),
                      itemCount: dumyData.length,
                      separatorBuilder: (context, index) =>
                          const VerticalSpace(10),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  final List<WishlistEntity> dumyData = const [
    WishlistEntity(
      productId: 1,
      price: 1,
      title: "Product Title",
      discountPercentage: 10,
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    ),
    WishlistEntity(
      productId: 1,
      price: 1,
      title: "Product Title",
      discountPercentage: 10,
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    ),
    WishlistEntity(
      productId: 1,
      price: 1,
      title: "Product Title",
      discountPercentage: 10,
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    ),
  ];
}
