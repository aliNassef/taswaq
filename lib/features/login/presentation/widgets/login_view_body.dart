import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/functions/build_error_message.dart';
import 'package:taswaq/core/shared/functions/build_loading_box.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/layout/presentation/views/layout_view.dart';
import 'package:taswaq/features/login/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:taswaq/features/login/presentation/widgets/donot_have_account.dart';
import 'package:taswaq/features/login/presentation/widgets/login_form.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            Navigator.pop(context);
            buildErrorMessage(context, errMessage: state.errMessage);
          }
          if (state is LoginLoading) {
            buildLoadingBox(context);
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed(LayoutView.routeName);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
              child: Text(
                'Login',
                style: AppStyles.textStyle24B.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ),
            const VerticalSpace(8),
            const DonotHaveAccount(),
            const VerticalSpace(32),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
