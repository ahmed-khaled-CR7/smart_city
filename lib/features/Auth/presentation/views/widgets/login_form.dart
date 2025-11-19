import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';
import 'package:smart_city/features/Auth/presentation/manager/cubit/sign_in_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();

    return Column(
      children: [
        CustomTextformField(
          title: 'National ID',
          hintText: 'Enter national ID',
          icon: Icons.perm_identity,
          inputType: const TextInputType.numberWithOptions(),
          controller: cubit.nationalIdController,
        ),
        SizedBox(height: 20.h),
        CustomTextformField(
          title: 'Password',
          hintText: 'Enter password',
          icon: Icons.lock,
          isObscure: true,
          controller: cubit.passwordController,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
