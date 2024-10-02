import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/custom_app_bar.dart';
import 'package:taswaq/core/utils/app_colors.dart';

import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});
  static const routeName = '/faqs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'FAQs'),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
        itemBuilder: (cxt, index) {
          return const FaqsItem();
        },
        separatorBuilder: (cxt, index) => const VerticalSpace(16),
        itemCount: 10,
      ),
    );
  }
}

class FaqsItem extends StatelessWidget {
  const FaqsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Can I cancel my order?',
          style: AppStyles.textStyle14M.copyWith(color: AppColors.blackColor),
        ),
        Text(
          'Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.',
          style: AppStyles.textStyle14R.copyWith(color: AppColors.gray150Color),
        ),
      ],
    );
  }
}
