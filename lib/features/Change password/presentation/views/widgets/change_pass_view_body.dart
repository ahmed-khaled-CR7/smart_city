// lib/features/profile/presentation/views/widgets/change_pass_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/custom_textfield.dart';

class ChangePassViewBody extends StatefulWidget {
  const ChangePassViewBody({super.key});

  @override
  State<ChangePassViewBody> createState() => _ChangePassViewBodyState();
}

class _ChangePassViewBodyState extends State<ChangePassViewBody> {
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _currentPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final current = _currentPassController.text;
    final newPass = _newPassController.text;
    final confirm = _confirmPassController.text;

    if (newPass != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New password and confirm password do not match'),
        ),
      );
      return;
    }

    // TODO: Call API to change password
    debugPrint('Change Password: $current → $newPass');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15.r,
            offset: Offset(0, 6.h),
          ),
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.05),
            blurRadius: 30.r,
            offset: Offset(0, 12.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _currentPassController,
            hintText: 'Current Password',
            obscureText: true,
          ),
          SizedBox(height: 16.h),

          CustomTextField(
            controller: _newPassController,
            hintText: 'New Password',
            obscureText: true,
          ),
          SizedBox(height: 16.h),

          CustomTextField(
            controller: _confirmPassController,
            hintText: 'Confirm New Password',
            obscureText: true,
          ),
          SizedBox(height: 24.h),

          CustomButton(
            text: 'CONFIRM CHANGES',
            color: AppColors.secondaryColor,
            onPressed: _onConfirm,
          ),
        ],
      ),
    );
  }
}
