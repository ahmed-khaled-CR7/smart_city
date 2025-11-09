import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/Login_form.dart';
import '../widgets/login_logo.dart';
import '../widgets/login_title.dart';
import '../widgets/divider_or.dart';
import '../widgets/signup_link.dart';
import '../widgets/auth_dialog.dart';
import 'package:smart_city/core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 0.9.sw,
          constraints: BoxConstraints(maxHeight: 0.85.sh, minHeight: 500.h),
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LoginLogo(),
                  SizedBox(height: 20.h),
                  const LoginTitle(),
                  SizedBox(height: 20.h),
                  const LoginForm(),
                  SizedBox(height: 20.h),
                  CustomButton(
                    color: AppColors.primaryColor,
                    text: 'Log In',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const AuthDialog(
                          Title: 'Logged In Successfully',
                          subTitle: 'Welcome to Smart City',
                        ),
                      );
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
        ),
      ),
    );
  }
}
