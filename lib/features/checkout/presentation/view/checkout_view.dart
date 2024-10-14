import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../widget/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = 'CheckoutView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Checkout'),
      body: const CheckoutViewBody(),
    );
  }
}
