import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/functions/get_user_data.dart';
import '../../../../core/utils/constants.dart';
import 'profile_list_items.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final name = getUserData().name!;
    final email = getUserData().email!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace(30),
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
