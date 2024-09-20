import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../manger/nav_bar_cubit/change_nav_cubit.dart';
import '../../../wishlist/presentation/view/wishlist_view.dart';

import 'bottom_nav_bar.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});
  final List<Widget> screens = const [
    HomeView(),
    CartView(),
    WishlistView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeNavCubit, ChangeNavState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: LazyIndexedStack(
                index: context.read<ChangeNavCubit>().currentIndex,
                children: screens,
              ),
            ),
            const BottomNavBar(),
          ],
        );
      },
    );
  }
}
