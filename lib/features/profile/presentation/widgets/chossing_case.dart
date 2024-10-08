import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../manger/order_history_cubit/order_history_cubit.dart';
import 'chossing_case_item.dart';

class ChossingCase extends StatelessWidget {
  const ChossingCase({
    super.key,
    required this.page,
  });
  final int page;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.h),
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.gray50Color,
      ),
      child: Row(
        children: [
          ChossingCaseItem(
            onTap: () {
              context.read<OrderHistoryCubit>().changeOrderPage(1);
            },
            text: 'Ongoing',
            isSelected: page == 1,
          ),
          ChossingCaseItem(
            onTap: () {
              context.read<OrderHistoryCubit>().changeOrderPage(2);
            },
            text: 'Completed',
            isSelected: page == 2,
          ),
        ],
      ),
    );
  }
}
