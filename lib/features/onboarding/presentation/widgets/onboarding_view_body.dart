import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../login/presentation/views/login_view.dart';
import '../../domain/entity/onboarding_entity.dart';
import 'pageview_items.dart';

import '../../../../core/utils/constants.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
  }

// ******* ALi Nassef Ibrahem Ahmed Shabana *******
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return PageViewItemData(
                  pageController: pageController,
                  currentPage: currentIndex,
                  instance: onboardingData[index],
                );
              },
              itemCount: 3,
            ),
          ),
          DefaultAppButton(
            onPressed: () {
              if (currentIndex == 2) {
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            },
            text: currentIndex == 2 ? 'Get Started' : 'Next',
            backgroundColor: AppColors.blackColor,
            textColor: Colors.white,
            padding: 0,
          ),
          const VerticalSpace(16),
          DotsIndicator(
            position: currentIndex,
            decorator: const DotsDecorator(
              spacing: EdgeInsets.all(4),
              color: AppColors.gray100Color,
              activeColor: AppColors.primaryColor,
            ),
            dotsCount: 3,
          ),
          const VerticalSpace(16),
        ],
      ),
    );
  }

  List<OnboardingEntity> onboardingData = [
    OnboardingEntity(
      title: 'Explore a wide range of products',
      description:
          'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
      image: AppImages.onboarding1,
    ),
    OnboardingEntity(
      title: 'Unlock exclusive offers and discounts',
      description:
          'Get access to limited-time deals and special promotions available only to our valued customers.',
      image: AppImages.onboarding2,
    ),
    OnboardingEntity(
      title: 'Safe and secure payments',
      description:
          ' QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
      image: AppImages.onboarding3,
    ),
  ];
}
