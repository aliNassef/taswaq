import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/wishlist/presentation/widgets/wish_item.dart';
import 'package:taswaq/features/wishlist/presentation/wishlist_cubit/wish_list_cubit.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'wishlist_topbar.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
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
                  log('message');
                },
                child: ListView.separated(
                  itemBuilder: (context, index) => const WishItem(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => const VerticalSpace(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
