// lib/features/auth/presentation/views/widgets/login_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_in_cubit.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/Custom_ScaffoldMessenger.dart';
import 'package:smart_city/features/profile/presentation/manger/cubit/profile_cubit.dart';
import '../widgets/login_logo.dart';
import '../widgets/login_title.dart';
import '../widgets/divider_or.dart';
import '../widgets/signup_link.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();

    return Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      body: SafeArea(
        child: Center(
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                context.read<ProfileCubit>().fetchUser();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/main',
                  (route) => false,
                );
              } else if (state is SignInFailure) {
                CustomScaffoldMessenger.showError(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return Container(
                width: 0.9.sw,
                constraints: BoxConstraints(
                  maxHeight: 0.85.sh,
                  minHeight: 500.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20.r,
                      offset: Offset(0, 4.h),
                    ),
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.05),
                      blurRadius: 40.r,
                      offset: Offset(0, 10.h),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 32.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const LoginLogo(),
                        SizedBox(height: 20.h),
                        const LoginTitle(),
                        SizedBox(height: 20.h),
                        Form(key: cubit.formKey, child: const LoginForm()),
                        SizedBox(height: 20.h),
                        state is SignInLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                              color: AppColors.primaryColor,
                              text: 'Log In',
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.signIn();
                                }
                              },
                            ),
                        SizedBox(height: 24.h),
                        const DividerOr(),
                        SizedBox(height: 24.h),
                        const SignupLink(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
