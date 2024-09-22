import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/features/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:taswaq/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_list_items.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../login/presentation/views/login_view.dart';
import '../../domain/repo/profile_repo.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final name = getIt<CacheHelper>().getData(key: ApiKey.name);
    final email = getIt<CacheHelper>().getData(key: ApiKey.email);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace(8),
        ListTile(
          title: Text(
            name,
            style: AppStyles.textStyle16SB.copyWith(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            email,
            style: AppStyles.textStyle14SB.copyWith(
              color: Colors.white,
            ),
          ),
          trailing: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: ProfileCubit(
                    getIt<ProfileRepo>(),
                  ),
                  child: const LogoutDialog(),
                ),
              );
              // context.read<ProfileCubit>().logout();
            },
            child: SvgPicture.asset(AppSvgs.logoutIcon),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://kawaiiai.com/wp-content/uploads/2022/09/gangaster-cat-7.jpg',
              height: 40.h,
              width: 40.w,
            ),
          ),
        ),
        const VerticalSpace(16),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: const ProfileListItems(),
          ),
        ),
      ],
    );
  }
}
