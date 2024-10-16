import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubits/get_search_result_cubit/get_search_result_cubit.dart';
import 'search_bar.dart';
import 'search_result_items.dart';
import 'search_top_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetSearchResultCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTopBar(),
          const VerticalSpace(16),
          CustomSearchBar(
            searchController: cubit.searchController,
            onSubmitted: (value) {
              cubit.getSearchResults(query: value);
            },
          ),
          const VerticalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RECENT SEARCH',
                  style: AppStyles.textStyle12SB.copyWith(
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                const VerticalSpace(8),
                const SearchResultItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
