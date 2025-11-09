import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_images.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(
        Assets.imagesAppLogo,
        width: 0.3.sw,
        height: 0.15.sh,
        fit: BoxFit.contain,
      ),
    );
  }
}
