import 'package:flutter/material.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextformField(
          title: 'National ID',
          hintText: 'Enter national ID',
          icon: Icons.perm_identity,
          inputType: const TextInputType.numberWithOptions(),
        ),
        SizedBox(height: 20.h),
        CustomTextformField(
          title: 'Password',
          hintText: 'Enter password',
          icon: Icons.lock,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
