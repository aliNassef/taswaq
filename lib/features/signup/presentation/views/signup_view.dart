import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignupViewBody(),
      ),
    );
  }
}
