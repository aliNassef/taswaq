import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/search/domain/repo/search_repo.dart';
import 'package:taswaq/features/search/presentation/cubits/get_search_result_cubit/get_search_result_cubit.dart';
import 'package:taswaq/features/search/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = '/searchView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetSearchResultCubit(
          getIt.get<SearchRepo>(),
        ),
        child: const SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
