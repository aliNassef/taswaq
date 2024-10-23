import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entity/onboarding_entity.dart';
import 'app_logo.dart';

import '../../../login/presentation/views/login_view.dart';

class PageViewItemData extends StatelessWidget {
  const PageViewItemData({
    super.key,
    required this.instance,
    required this.pageController,
    required this.currentPage,
  });

  final OnboardingEntity instance;
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            color: const Color(0xffF4FDFA),
            image: DecorationImage(
              image: AssetImage(instance.image),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentPage == 0
                        ? const AppLogo()
                        : InkWell(
                            onTap: () {
                              !pageController.hasClients
                                  ? log('0')
                                  : pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeIn,
                                    );
                            },
                            child:
                                const Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                    Visibility(
                      visible: currentPage != 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginView.routeName);
                        },
                        child: Text(
                          'Skip for now',
                          style: AppStyles.textStyle14M.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
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
          instance.title,
          style: AppStyles.textStyle24B.copyWith(
            color: AppColors.blackColor,
          ),
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(16),
        Text(
          instance.description,
          style: AppStyles.textStyle14R.copyWith(
            color: AppColors.gray150Color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
