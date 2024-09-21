import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/features/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_list_items.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../login/presentation/views/login_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutSuccess) {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(8),
          ListTile(
            title: Text(
              'Ali Nassef',
              style: AppStyles.textStyle16SB.copyWith(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'anassef798@gmail.com',
              style: AppStyles.textStyle14SB.copyWith(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<ProfileCubit>().logout();
              },
              icon: SvgPicture.asset(AppSvgs.logoutIcon),
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
      ),
    );
  }
}
