import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/profile_repo.dart';

import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/features/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:taswaq/features/profile/presentation/widgets/logout_dialog.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.name,
    required this.email,
  });

  final dynamic name;
  final dynamic email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
