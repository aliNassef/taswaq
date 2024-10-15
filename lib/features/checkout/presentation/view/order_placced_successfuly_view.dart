import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/utils/app_images.dart';

import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class OrderPlacedSuccessfuly extends StatelessWidget {
  const OrderPlacedSuccessfuly({super.key});
  static const routeName = 'OrderPlaccedSuccessfuly';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffF4FDFA),
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.orderPlaceholder,
                  ),
                ),
              ),
              Text(
                'Your order has been placed successfully',
                style: AppStyles.textStyle24B.copyWith(
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(16),
              Text(
                'Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',
                style: AppStyles.textStyle14R.copyWith(
                  color: AppColors.gray150Color,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(24),
              DefaultAppButton(
                text: 'Continue Shopping',
                backgroundColor: AppColors.blackColor,
                textColor: Colors.white,
                onPressed: () {},
                padding: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
