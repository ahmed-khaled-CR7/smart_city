import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextformField extends StatelessWidget {
  const CustomTextformField({
    super.key,
    this.inputType,
    this.onChanged,
    this.title,
    this.icon,
    this.hintText = '',
    this.isObscure = false,
    this.validator,
    this.controller,
  });

  final TextInputType? inputType;
  final String hintText;
  final String? title;
  final Function(String)? onChanged;
  final bool isObscure;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        if (title != null)
          Padding(
            padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
            child: Text(
              title!,
              style: TextStyle(
                color: const Color(0xff1E1E1E),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: isObscure,
          obscuringCharacter: '●',
          style: TextStyle(color: const Color(0xff5C5C5C), fontSize: 14.sp),
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon:
                icon != null
                    ? Icon(icon, size: 24.r, color: const Color(0xff5C5C5C))
                    : null,
            prefixIconConstraints: BoxConstraints(
              minWidth: 50.w,
              minHeight: 60.h,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff5C5C5C),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffD1D5DB), width: 1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Color(0xFF3AAFA9)),
              borderRadius: BorderRadius.circular(16.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
      ],
    );
  }
}
