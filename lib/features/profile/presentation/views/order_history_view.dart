import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../domain/repo/profile_repo.dart';
import '../manger/order_history_cubit/order_history_cubit.dart';
import '../widgets/order_history_view_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});
  static const routeName = 'OrderHistoryView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Order History'),
      body: BlocProvider(
        create: (context) => OrderHistoryCubit(
          getIt<ProfileRepo>(),
        )..getUserOrders(),
        child: OrderHistoryViewBody(),
      ),
    );
  }
}
