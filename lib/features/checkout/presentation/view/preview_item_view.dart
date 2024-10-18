import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../widget/preview_item.dart';

class PreviewItemView extends StatelessWidget {
  const PreviewItemView({super.key});
  static const String routeName = 'PreviewItemView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Preview Item'),
      body: ListView.separated(
        itemBuilder: (context, index) => PreviewItem(
          product: checkoutProducts[index],
        ),
        separatorBuilder: (context, index) => const VerticalSpace(10),
        itemCount: checkoutProducts.length,
      ),
    );
  }
}
