import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/cubit/checkout_cubit.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../domain/repo/checkout_repo.dart';
import '../widget/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = 'CheckoutView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Checkout'),
      body: BlocProvider(
        create: (context) => CheckoutCubit(
          getIt<CheckoutRepo>(),
        ),
        child: const CheckoutViewBody(),
      ),
    );
  }
}
