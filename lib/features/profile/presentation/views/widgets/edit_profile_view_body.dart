import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_header.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 0.9.sw,
          constraints: BoxConstraints(maxHeight: 0.95.sh, minHeight: 500.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeader(title: 'Edit Profile'),
                  SizedBox(height: 30.h),
                  CustomTextformField(
                    title: 'Full Name',
                    hintText: 'Enter full name',
                    inputType:  TextInputType.text,
                  ),
                  SizedBox(height: 16.h),
                 CustomTextformField(
                    title: 'City',
                    hintText: 'Enter city',
                    inputType:  TextInputType.text,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformField(
                    title: 'Phone Number',
                    hintText: 'Enter phone number',
                    inputType:  TextInputType.phone,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformField(
                    title: 'Email',
                    hintText: 'Enter email',
                    inputType:  TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformField(
                    title: 'Address',
                    hintText: 'Enter address',
                    inputType:  TextInputType.text,
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    color: AppColors.secondaryColor,
                    text: 'Save Changes',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
