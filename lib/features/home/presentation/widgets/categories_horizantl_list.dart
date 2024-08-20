import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../cubits/get_categories_cubit/get_categories_cubit.dart';
import '../cubits/get_categories_cubit/get_categories_state.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import 'category_item.dart';

class CategoriesHorizantalList extends StatelessWidget {
  const CategoriesHorizantalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesFailure) {
          return Text(state.errMessage);
        }
        if (state is GetCategoriesLoaded) {
          return SizedBox(
            height: 80.h,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => const HorizantalSpace(10),
              itemBuilder: (context, index) => CategoryItem(
                categoryName: state.categories[index],
              ),
            ),
          );
        }
        return SizedBox(
          height: 80.h,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (context, index) => const HorizantalSpace(10),
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 80.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
