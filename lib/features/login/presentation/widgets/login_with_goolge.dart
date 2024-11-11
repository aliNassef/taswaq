import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubit/login_cubit/login_cubit.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<LoginCubit>().loginWithGoogle();
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
        height: 60.h,
        width: MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray50Color,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login with Google',
              style: AppStyles.textStyle14SB.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            const HorizantalSpace(10),
            SvgPicture.asset(AppSvgs.googleIcon),
          ],
        ),
      ),
    );
  }
}
