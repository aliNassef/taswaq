import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../domain/repo/checkout_repo.dart';
import '../manger/cubit/checkout_cubit.dart';
import '../widget/checkout_review_view_body.dart';

class CheckoutReviewView extends StatelessWidget {
  const CheckoutReviewView({super.key});
  static const routeName = 'checkout_review';
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Checkout Review'),
      body: BlocProvider(
        create: (context) => CheckoutCubit(
          getIt<CheckoutRepo>(),
        )..getUserAddress(),
        child: const CheckoutReviewViewBody(),
      ),
    );
  }
}
