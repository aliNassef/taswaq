import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'login_form_title.dart';
import 'login_with_goolge.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginFormTitle(
              title: 'Email ',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              controller: cubit.emailController,
              hintText: 'Enter your email',
            ),
            const VerticalSpace(16),
            const LoginFormTitle(
              title: 'Password ',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              isPassword: true,
              controller: cubit.passwordController,
              hintText: 'Enter your password',
            ),
            const VerticalSpace(24),
            DefaultAppButton(
              padding: 0,
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.login();
                }
              },
              text: 'Login',
              backgroundColor: AppColors.blackColor,
              textColor: Colors.white,
            ),
            const VerticalSpace(24),
            const LoginWithGoogle(),
          ],
        ),
      ),
    );
  }
}
