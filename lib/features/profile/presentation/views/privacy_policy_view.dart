import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  static const String routeName = 'PrivacyPolicyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChangePassAppBar(),
      body: const Center(
        child: Text('Privacy Policy'),
      ),
    );
  }

  AppBar buildChangePassAppBar() {
    return AppBar(
      title: Text(
        'Privacy Policy',
        style: AppStyles.textStyle14M,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
