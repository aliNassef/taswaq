import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class TermsCondationsView extends StatelessWidget {
  const TermsCondationsView({super.key});
  static const routeName = '/terms-condations-view';
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
        'Terms & Conditions',
        style: AppStyles.textStyle14M,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
