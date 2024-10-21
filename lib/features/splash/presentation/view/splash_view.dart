import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/utils/app_images.dart';
import '../../../layout/presentation/views/layout_view.dart';
import '../../../onboarding/presentation/view/onboading_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 300),
      () => checkiFLoggedIn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RepaintBoundary(
                child: Image(
                  image: AssetImage(AppImages.quickSign),
                ),
              ),
              HorizantalSpace(5),
              RepaintBoundary(
                child: Image(
                  image: AssetImage(AppImages.quickMarket),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkiFLoggedIn() {
    bool isContainkey = CacheHelper().containsKey(key: ApiKey.isLoggedIn);
    bool isLoggedIn = CacheHelper().getData(key: ApiKey.isLoggedIn) == true;

    if (isContainkey && isLoggedIn) {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    }
  }
}
