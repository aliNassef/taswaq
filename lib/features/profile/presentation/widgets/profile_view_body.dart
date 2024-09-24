import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_list_items.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'user_info.dart';

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
        UserInfo(name: name, email: email),
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
