import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/nav_bar_cubit/change_nav_cubit.dart';
import '../widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = '/layout';
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
      },
      child: BlocProvider(
        create: (context) => ChangeNavCubit(),
        child: const Scaffold(
          bottomNavigationBar: LayoutViewBody(),
        ),
      ),
    );
  }
}
