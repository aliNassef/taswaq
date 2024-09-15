import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/wishlist/presentation/widgets/wish_item.dart';
import 'package:taswaq/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'wishlist_topbar.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WishListCubit>();
    return Column(
      children: [
        const VerticalSpace(30),
        const WishListTopBar(),
        Expanded(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.black,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              await cubit.getWishListData();
            },
            child: BlocBuilder<WishListCubit, WishListState>(
              builder: (context, state) {
                if (state is WishListSuccess) {
                  return ListView.separated(
                    itemBuilder: (context, index) => WishItem(
                      instance: state.wishList[index],
                    ),
                    itemCount: state.wishList.length,
                    separatorBuilder: (context, index) =>
                        const VerticalSpace(10),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
