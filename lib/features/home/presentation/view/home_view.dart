import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/home/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import 'package:taswaq/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';

import '../../../../core/di/dependency_injuction.dart';
import '../../domain/repo/home_repo.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetProductsCubit(
              getIt.get<HomeRepo>(),
            )..getProducts(),
          ),
          BlocProvider(
            create: (context) => GetCategoriesCubit(
              getIt.get<HomeRepo>(),
            )..getCategories(),
          ),
        ],
        child: const SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
