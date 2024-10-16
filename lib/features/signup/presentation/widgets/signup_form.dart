import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import 'signup_form_title.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignupFormTitle(
              title: 'Full Name ',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              controller: cubit.nameController,
              hintText: 'Enter your name',
            ),
            const VerticalSpace(16),
            const SignupFormTitle(
              title: 'Email',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              controller: cubit.emailController,
              hintText: 'Enter your email',
            ),
            const VerticalSpace(16),
            const SignupFormTitle(
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
                  cubit.signUp();
                }
              },
              text: 'Create Account',
              backgroundColor: AppColors.blackColor,
              textColor: Colors.white,
            ),
            const VerticalSpace(24),
          ],
        ),
      ),
    );
  }
}
