import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/cart/presentation/views/cart_view.dart';
import 'package:taswaq/features/home/presentation/view/home_view.dart';

import '../../../../core/utils/app_router.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = '/layout';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LayoutViewBody(),
    );
  }
}

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      bottomScreenMargin: 0,
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      // padding: const EdgeInsets.symmetric(vertical: 10),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      // decoration: buildNavBarDecoration(),
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 40.h,
      navBarStyle:
          NavBarStyle.style5, // Choose the nav bar style with this property
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CartView(),
      Container(),
      Container(),
    ];
  }

  List<String> icons = [
    AppSvgs.homeIcon,
    AppSvgs.cartIcon,
    AppSvgs.favIcon,
    AppSvgs.profileIcon,
  ];
  List<String> activeIcons = [
    AppSvgs.activeHomeIcon,
    AppSvgs.activeCartIcon,
    AppSvgs.activeFavIcon,
    AppSvgs.activeProfileIcon,
  ];

  List<String> titles = [
    'Home',
    'My Cart',
    'Wishlist',
    'Profile',
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: titles[0],
        textStyle: AppStyles.textStyle12SB,
        iconSize: 24,
        inactiveIcon: SvgPicture.asset(icons[0]),
        icon: SvgPicture.asset(activeIcons[0]),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        title: titles[1],
        textStyle: AppStyles.textStyle12SB,
        inactiveIcon: SvgPicture.asset(icons[1]),
        icon: SvgPicture.asset(activeIcons[1]),
        activeColorSecondary: AppColors.primaryColor,
        iconSize: 24,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        title: titles[2],
        textStyle: AppStyles.textStyle12SB,
        icon: SvgPicture.asset(
          activeIcons[2],
        ),
        iconSize: 24,
        inactiveIcon: SvgPicture.asset(icons[2]),
        activeColorSecondary: AppColors.primaryColor,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        title: titles[3],
        textStyle: AppStyles.textStyle12SB,
        icon: SvgPicture.asset(
          activeIcons[3],
        ),
        iconSize: 24,
        activeColorSecondary: AppColors.primaryColor,
        inactiveIcon: SvgPicture.asset(
          icons[3],
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  NavBarDecoration buildNavBarDecoration() {
    return NavBarDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 7,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
      colorBehindNavBar: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );
  }
}
