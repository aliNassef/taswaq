import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taswaq/features/home/presentation/cubits/get_categories_cubit/get_categories_cubit.dart';
import '../cubits/get_categories_cubit/get_categories_state.dart';

class OfferHorizantalList extends StatelessWidget {
  const OfferHorizantalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      buildWhen: (previous, current) =>
          current is GetOffersLoaded ||
          current is GetOffersFailure ||
          current is GetOffersLoading,
      builder: (context, state) {
        if (state is GetOffersFailure) {
          return Text(
            state.errMessage,
          );
        }
        if (state is GetOffersLoaded) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 148.h,
            child: CarouselSlider.builder(
              itemCount: state.images.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.images[index],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              options: CarouselOptions(height: 148.h, viewportFraction: 0.9),
            ),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 148.h,
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      // color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(height: 148.h, viewportFraction: 0.9),
              ),
            ),
          );
        }
      },
    );
  }
}
