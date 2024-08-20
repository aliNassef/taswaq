import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../cubits/get_search_result_cubit/get_search_result_cubit.dart';
import 'search_item.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class SearchResultItems extends StatelessWidget {
  const SearchResultItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchResultCubit, GetSearchResultState>(
      buildWhen: (previous, current) =>
          current is GetSearchResultLoaded ||
          current is GetSearchResultFailure ||
          current is GetSearchResultLoading,
      builder: (context, state) {
        if (state is GetSearchResultFailure) {
          return Text(state.errMessage);
        }
        if (state is GetSearchResultLoaded) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 200.h,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return SearchItem(product: product);
              },
            ),
          );
        } else if (state is GetSearchResultLoading) {
          return Expanded(
            child: GridView.builder(
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 200.h,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 138.h,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const VerticalSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: 20.h,
                            color: Colors.white,
                          ),
                        ),
                        const VerticalSpace(4),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 80.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
/**



 */