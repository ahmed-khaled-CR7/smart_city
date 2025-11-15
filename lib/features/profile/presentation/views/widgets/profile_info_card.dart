// lib/features/profile/presentation/views/widgets/profile_info_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_field.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileSuccess) {
            final user = state.user;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileField(label: 'Full Name', value: user.name),
                const Divider(),
                ProfileField(label: 'National ID', value: user.nationalId),
                const Divider(),
                ProfileField(label: 'City', value: user.address),
                const Divider(),
                ProfileField(label: 'Email', value: user.email),
                const Divider(),
                ProfileField(label: 'Phone Number', value: user.phone),
              ],
            );
          }

          if (state is ProfileFailure) {
            return Text(
              'Error: ${state.message}',
              style: const TextStyle(color: Colors.red),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
