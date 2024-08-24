
import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/custom_text_form_field.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/signup/presentation/widgets/signup_form_title.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignupFormTitle(
              title: 'Full Name ',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Enter your name',
            ),
            const VerticalSpace(16),
            const SignupFormTitle(
              title: 'Email',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Enter your email',
            ),
            const VerticalSpace(16),
            const SignupFormTitle(
              title: 'Password ',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Enter your password',
            )
          ],
        ),
      ),
    );
  }
}
