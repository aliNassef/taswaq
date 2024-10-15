import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../widget/checkout_review_view_body.dart';


class CheckoutReviewView extends StatelessWidget {
  const CheckoutReviewView({super.key});
  static const routeName = 'checkout_review';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Checkout Review'),
      body: const CheckoutReviewViewBody(),
    );
  }
}
