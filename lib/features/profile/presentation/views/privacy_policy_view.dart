import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../manger/profile_cubit/profile_cubit.dart';
import '../widgets/pricvacy_item.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/profile_repo.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  static const String routeName = 'PrivacyPolicyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrivacyAppBar(),
      body: BlocProvider(
        create: (context) => ProfileCubit(
          getIt<ProfileRepo>(),
        )..getPrivacyData(),
        child: Builder(builder: (context) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) =>
                current is ProfilePrivacyDataFailure ||
                current is ProfilePrivacyDataSuccess ||
                current is ProfilePrivacyDataLoading,
            builder: (context, state) {
              if (state is ProfilePrivacyDataFailure) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
              if (state is ProfilePrivacyDataSuccess) {
                final instance = state.privacyData;
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kHorizantalpadding.w),
                  child: ListView(
                    children: [
                      Text(
                        'Our Policy',
                        style: AppStyles.textStyle24B,
                      ),
                      Text(
                        instance.ourPolicy!,
                        style: AppStyles.textStyle14M,
                      ),
                      // const VerticalSpace(16),
                      PrivacyItem(
                          title: '1. Information Collection:',
                          description: instance.collectionInfo!),
                      const VerticalSpace(16),
                      PrivacyItem(
                          title: '2. Information Use:',
                          description: instance.useInfo!),
                      const VerticalSpace(16),
                      PrivacyItem(
                          title: '3. Information Sharing:',
                          description: instance.sharingInfo!),
                      const VerticalSpace(16),
                      PrivacyItem(
                          title: '4. Data Security:',
                          description: instance.dataSecurity!),
                      const VerticalSpace(16),
                      PrivacyItem(
                          title: '5. User Rights:',
                          description: instance.userRights!),
                      const VerticalSpace(16),
                      PrivacyItem(
                          title: '6. Children\'s Privacy:',
                          description: instance.childrenPrivacy!),
                      const VerticalSpace(16),
                      PrivacyItem(
                          title: '7. Updates to the Privacy Policy:',
                          description: instance.updatesPrivacy!),
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

  AppBar buildPrivacyAppBar() {
    return AppBar(
      title: Text(
        'Privacy Policy',
        style: AppStyles.textStyle14M,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
