import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_field.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileField(label: 'Full Name', value: 'Youssef Sameh'),
          Divider(),
          ProfileField(label: 'National ID', value: '1234567890'),
          Divider(),
          ProfileField(label: 'City', value: 'Fayoum'),
          Divider(),
          ProfileField(label: 'Email', value: 'ysameh@gmail.com'),
          Divider(),
          ProfileField(label: 'Phone Number', value: '01234567890'),
        ],
      ),
    );
  }
}
