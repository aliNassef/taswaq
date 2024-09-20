import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_images.dart';
import '../manger/nav_bar_cubit/change_nav_cubit.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key, required this.index, required this.icon});
  final int index;
  final String icon;
  final List<String> activeIcons = const [
    AppSvgs.activeHomeIcon,
    AppSvgs.activeCartIcon,
    AppSvgs.activeFavIcon,
    AppSvgs.activeProfileIcon,
  ];
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangeNavCubit>();
    return Expanded(
      child: InkWell(
        onTap: () {
          cubit.changeNavIndex(index);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                cubit.currentIndex == index ? activeIcons[index] : icon,
                width: MediaQuery.of(context).size.height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
