import 'package:flutter/material.dart';
import 'package:taswaq/features/wishlist/presentation/widgets/wish_item.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'wishlist_topbar.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpace(30),
        WishListTopBar(),
        WishItem(),
      ],
    );
  }
}
