import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_images.dart';
import '../manger/nav_bar_cubit/change_nav_cubit.dart';
import 'bottom_nav_bar_item.dart';
 
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  final List<String> icons = const [
    AppSvgs.homeIcon,
    AppSvgs.cartIcon,
    AppSvgs.favIcon,
    AppSvgs.profileIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BlocBuilder<ChangeNavCubit, ChangeNavState>(
        builder: (context, state) {
          return Row(
            children: List.generate(
              4,
              (index) => BottomNavBarItem(
                index: index,
                icon: icons[index],
              ),
            ),
          );
        },
      ),
    );
  }
}