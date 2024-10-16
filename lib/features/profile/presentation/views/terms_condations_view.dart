import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../manger/profile_cubit/profile_cubit.dart';
import '../widgets/terms_condation_item.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/profile_repo.dart';

class TermsCondationsView extends StatelessWidget {
  const TermsCondationsView({super.key});
  static const routeName = '/terms-condations-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Terms & Conditions'),
      body: BlocProvider(
        create: (context) => ProfileCubit(
          getIt<ProfileRepo>(),
        )..getTermsAndConditions(),
        child: Builder(builder: (context) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) =>
                current is ProfileTermsDataSuccess ||
                current is ProfileTermsDataFailure ||
                current is ProfileTermsDataLoading,
            builder: (context, state) {
              if (state is ProfileTermsDataFailure) {
                return const SafeArea(
                  child: Center(
                    child: Text('Something went wrong'),
                  ),
                );
              } else if (state is ProfileTermsDataSuccess) {
                final instance = state.entity;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
                  child: ListView(
                    children: [
                      Text(
                        'Terms & Conditions',
                        style: AppStyles.textStyle24B,
                      ),
                      Text(
                        instance.terms1,
                        style: AppStyles.textStyle14M,
                      ),
                      // const VerticalSpace(16),
                      TermsCondationItem(
                          title: '1. Account Registration:',
                          description: instance.terms2),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '2. Product Information and Pricing:',
                          description: instance.terms3),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '3. Order Placement and Fulfillment:',
                          description: instance.terms4),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '4. Payment:', description: instance.terms5),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '5. Shipping and Delivery:',
                          description: instance.terms6),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '6. Returns and Refunds:',
                          description: instance.terms7),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '7. Intellectual Property:',
                          description: instance.terms8),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '8. User Conduct:',
                          description: instance.terms8),
                      const VerticalSpace(16),
                      TermsCondationItem(
                          title: '9. Limitation of Liability:',
                          description: instance.terms8),
                      const VerticalSpace(16),
                    ],
                  ),
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
