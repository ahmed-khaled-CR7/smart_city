// lib/features/profile/presentation/views/widgets/profile_view_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/Change%20password/presentation/views/change_pass_view.dart';
import 'package:smart_city/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/logout_dialog.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_avatar.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_info_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
            width: 0.9.sw,
            margin: EdgeInsets.only(top: 20.h, bottom: 40.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
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
            child: Column(
              children: [
                const ProfileHeader(title: 'My Profile'),
                SizedBox(height: 20.h),

                const ProfileAvatar(),
                SizedBox(height: 24.h),

                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ProfileSuccess) {
                      return const ProfileInfoCard();
                    }

                    if (state is ProfileFailure) {
                      return Text(
                        'Error: ${state.message}',
                        style: TextStyle(color: Colors.red, fontSize: 14.sp),
                      );
                    }

                    return const SizedBox();
                  },
                ),

                SizedBox(height: 30.h),

                // My Complaints & Suggestions
                CustomButton(
                  color: AppColors.primaryColor,
                  text: 'My Complaints & Suggestions',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/my-complaints-and-suggestions',
                    );
                  },
                ),
                SizedBox(height: 10.h),

                CustomButton(
                  color: AppColors.primaryColor,
                  text: 'Log Out',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => LogoutDialog(
                        title: 'Are you sure you want to log out?',
                        subTitle: 'You can log in again at any time',
                        onConfirm: () {
                          context.read<ProfileCubit>().logout(context);
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 10.h),

                CustomButton(
                  text: 'Change Password',
                  color: AppColors.secondaryColor,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ChangePassView.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
