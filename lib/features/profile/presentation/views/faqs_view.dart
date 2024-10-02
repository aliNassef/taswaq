import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/shared/widgets/custom_app_bar.dart';
import 'package:taswaq/features/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../domain/repo/profile_repo.dart';
import '../widgets/faqs_item.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});
  static const routeName = '/faqs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'FAQs'),
      body: BlocProvider(
        create: (context) => ProfileCubit(getIt<ProfileRepo>())..getFaqs(),
        child: Builder(builder: (context) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) =>
                current is ProfileFaqsSuccess ||
                current is ProfileFaqsFailure ||
                current is ProfileFaqsLoading,
            builder: (context, state) {
              if (state is ProfileFaqsFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              }
              if (state is ProfileFaqsSuccess) {
                final data = state.faqs;
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
                  itemBuilder: (cxt, index) {
                    return FaqsItem(
                      instance: data[index],
                    );
                  },
                  separatorBuilder: (cxt, index) => const VerticalSpace(16),
                  itemCount: data.length,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          );
        }),
      ),
    );
  }
}
