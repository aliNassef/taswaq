import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});
  static const routeName = '/faqs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChangePassAppBar(),
      body: const Center(),
    );
  }

  AppBar buildChangePassAppBar() {
    return AppBar(
      title: Text(
        'FAQs',
        style: AppStyles.textStyle14M,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
