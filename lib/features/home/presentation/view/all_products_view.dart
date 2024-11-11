import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/home_repo.dart';
import '../cubits/get_products_cubit/get_products_cubit.dart';
import '../widgets/all_products_view_body.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});
  static const routeName = 'all-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: AppStyles.textStyle14M,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              GetProductsCubit(getIt.get<HomeRepo>())..getProducts(),
          child: const AllProductsViewBody(),
        ),
      ),
    );
  }
}
