import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/functions/build_error_message.dart';
import 'package:taswaq/core/shared/functions/build_loading_box.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/signup/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:taswaq/features/signup/presentation/widgets/have_accoount.dart';
import 'package:taswaq/features/signup/presentation/widgets/signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            // navigate to home screen
            Navigator.pop(context);
            //     Navigator.of(context).pushReplacementNamed(HomeView.routeName);
          }

          if (state is SignupFailure) {
            Navigator.pop(context);
            buildErrorMessage(context, errMessage: state.errMessage);
          }
          if (state is SignupLoading) {
            buildLoadingBox(context);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
                child: Text(
                  'Signup',
                  style: AppStyles.textStyle24B.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              const VerticalSpace(8),
              const HaveAccount(),
              const VerticalSpace(32),
              const SignupForm(),
            ],
          );
        },
      ),
    );
  }
}
