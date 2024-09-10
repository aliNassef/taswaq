import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/layout/presentation/cubit/change_nav_cubit.dart';
import 'package:taswaq/features/layout/presentation/widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = '/layout';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeNavCubit(),
      child: const Scaffold(
        bottomNavigationBar: LayoutViewBody(),
      ),
    );
  }
}
