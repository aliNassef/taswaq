
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/core/utils/constants.dart';
import 'package:taswaq/features/onboarding/presentation/widgets/app_logo.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .55,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              color: const Color(0xffF4FDFA),
              image: const DecorationImage(
                image: AssetImage(AppImages.onboarding1),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppLogo(),
                      Text(
                        'Skip for now',
                        style: AppStyles.textStyle14M.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const VerticalSpace(24),
          Text(
            'Explore a wide range of products',
            style: AppStyles.textStyle24B.copyWith(
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(16),
          Text(
            'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
            style: AppStyles.textStyle14R.copyWith(
              color: AppColors.gray150Color,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(24),
          const DefaultAppButton(
            text: 'Next',
            backgroundColor: AppColors.blackColor,
            textColor: Colors.white,
            padding: 0,
          ),
          const VerticalSpace(24),
          DotsIndicator(
            decorator: const DotsDecorator(
              spacing: EdgeInsets.all(4),
              color: AppColors.gray100Color,
              activeColor: AppColors.primaryColor,
            ),
            dotsCount: 3,
          ),
        ],
      ),
    );
  }
}
