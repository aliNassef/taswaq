import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    this.increment,
    this.decrement,
    required this.quantity,
  });
  final void Function()? increment;
  final void Function()? decrement;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: MediaQuery.sizeOf(context).width * .3,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1.2,
            color: AppColors.gray50Color,
          ),
        ],
        border: Border.all(
          width: 3,
          color: AppColors.gray50Color,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: decrement,
            child: const Icon(
              Icons.remove,
              color: AppColors.blackColor,
            ),
          ),
          const HorizantalSpace(10),
          Text(
            '$quantity',
            style: AppStyles.textStyle16M.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          const HorizantalSpace(10),
          InkWell(
            onTap: increment,
            child: const Icon(
              Icons.add,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
