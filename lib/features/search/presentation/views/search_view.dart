import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../domain/repo/search_repo.dart';
import '../cubits/get_search_result_cubit/get_search_result_cubit.dart';
import '../widgets/search_view_body.dart';

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
