import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/config/signup_fields_config.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_up_cubit.dart';
import 'package:smart_city/features/Auth/presentation/views/login_view.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/Custom_ScaffoldMessenger.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/auth_dialog.dart';
import 'signup_fields_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    final fieldsConfig = SignupFieldsConfig(
      emailController: cubit.emailController,
      passwordController: cubit.passwordController,
      confirmPasswordController: cubit.confirmPasswordController,
      phoneController: cubit.phoneController,
      nationalIdController: cubit.nationalIdController,
      nameController: cubit.nameController,
      addressController: cubit.addressController,
    );

    return Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      appBar: _buildAppBar(),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) => _handleState(context, state),
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Column(
                children: [
                  SignupFieldsWidget(fieldsConfig: fieldsConfig, cubit: cubit),
                  SizedBox(height: 28.h),

                  // BUTTON
                  state is SignUpLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                        color: AppColors.primaryColor,
                        text: 'Create Account',
                        onPressed: () => cubit.signUp(),
                      ),

                  SizedBox(height: 18.h),
                  _loginText(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.lightprimaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Create New Account',
        style: AppTextStyles.bold20.copyWith(color: const Color(0xFF1E1E1E)),
      ),
    );
  }

  void _handleState(BuildContext context, SignUpState state) {
    if (state is SignUpSuccess) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => const AuthDialog(
              subTitle: 'You can log in now!',
              Title: 'Account Created Successfully!',
            ),
      );
    } else if (state is SignUpFailure) {
      CustomScaffoldMessenger.showError(context, state.errMessage);
    }
  }

  Widget _loginText(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.medium18.copyWith(color: AppColors.secondaryColor),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Log in',
            style: AppTextStyles.medium18.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
          ),
        ],
      ),
    );
  }
}
