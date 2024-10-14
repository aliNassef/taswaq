import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/features/checkout/presentation/widget/custom_dvider.dart';
import '../../../../core/utils/app_images.dart';
import 'step_item.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StepItem(
            title: 'Shipping',
            img: AppSvgs.shippingAddress,
          ),
          CustomDvider(),
          StepItem(
            title: 'Payment',
            img: AppSvgs.paymentMethod,
          ),
          CustomDvider(),
          StepItem(
            title: 'Review',
            img: AppSvgs.review,
          ),
        ],
      ),
    );
  }
}

