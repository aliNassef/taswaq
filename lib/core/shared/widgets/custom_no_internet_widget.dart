import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_styles.dart';

class CustomNoInternetWidget extends StatelessWidget {
  const CustomNoInternetWidget({super.key});
  static const routeName = '/custom_no_internet_widget';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/no_internet.json',
              height: MediaQuery.of(context).size.height * .75,
            ),
            Text(
              'No Internet Connection',
              style: AppStyles.textStyle24B,
            ),
          ],
        ),
      ),
    );
  }
}
