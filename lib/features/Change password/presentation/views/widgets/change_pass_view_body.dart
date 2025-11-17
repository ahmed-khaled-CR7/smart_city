import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/Change password/presentation/manger/cubit/change_password_cubit.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/custom_textfield.dart';

class ChangePassViewBody extends StatefulWidget {
  const ChangePassViewBody({super.key});

  @override
  State<ChangePassViewBody> createState() => _ChangePassViewBodyState();
}

class _ChangePassViewBodyState extends State<ChangePassViewBody> {
  bool _showCurrentPass = false;
  bool _showNewPass = false;
  bool _showConfirmPass = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 0.9.sw,
          constraints: BoxConstraints(minHeight: 520.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20.r,
                offset: Offset(0, 8.h),
              ),
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.08),
                blurRadius: 40.r,
                offset: Offset(0, 16.h),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Change Your Password',
                style: AppTextStyles.bold28.copyWith(
                  color: AppColors.secondaryColor2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Enter your current password and choose a new one',
                style: AppTextStyles.regular13.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28.h),

              CustomTextField(
                controller: cubit.oldPassController,
                hintText: 'Current Password',
                isObscure: !_showCurrentPass,
                icon: IconButton(
                  icon: Icon(
                    _showCurrentPass ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                  onPressed:
                      () =>
                          setState(() => _showCurrentPass = !_showCurrentPass),
                ),
                maxLines: 1,
                obscureText: true,
              ),
              SizedBox(height: 16.h),

              CustomTextField(
                controller: cubit.newPassController,
                hintText: 'New Password',
                isObscure: !_showNewPass,
                icon: IconButton(
                  icon: Icon(
                    _showNewPass ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () => setState(() => _showNewPass = !_showNewPass),
                ),
                maxLines: 1,
                obscureText: true,
              ),
              SizedBox(height: 8.h),
              _buildValidationText(
                'At least 6 characters, include numbers & symbols',
              ),
              SizedBox(height: 16.h),

              CustomTextField(
                controller: cubit.confirmPassController,
                hintText: 'Confirm New Password',
                isObscure: !_showConfirmPass,
                icon: IconButton(
                  icon: Icon(
                    _showConfirmPass ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                  onPressed:
                      () =>
                          setState(() => _showConfirmPass = !_showConfirmPass),
                ),
                maxLines: 1,
                obscureText: true,
              ),
              SizedBox(height: 28.h),

              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Password changed successfully!'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  } else if (state is ChangePasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return state is ChangePasswordLoading
                      ? const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                      : CustomButton(
                        text: 'confirm changes',
                        color: AppColors.secondaryColor,
                        onPressed: cubit.changePassword,
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValidationText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Text(
          text,
          style: AppTextStyles.regular13.copyWith(
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
