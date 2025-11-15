// lib/features/Auth/presentation/views/widgets/signup_fields_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/config/signup_fields_config.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_up_cubit.dart';

class SignupFieldsWidget extends StatelessWidget {
  final SignupFieldsConfig fieldsConfig;
  final SignUpCubit cubit;

  const SignupFieldsWidget({
    super.key,
    required this.fieldsConfig,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          fieldsConfig
              .getFields()
              .map(
                (f) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomTextformField(
                    title: f['title'],
                    hintText: f['hint'],
                    controller: f['controller'],
                    icon: f['icon'],
                    inputType: f['input'] ?? TextInputType.text,
                    isObscure: f['obscure'] ?? false,
                    validator: (value) => _validator(f['title'], value),
                  ),
                ),
              )
              .toList(),
    );
  }

  String? _validator(String? field, String? value) {
    if (value == null || value.isEmpty) return '$field is required';
    switch (field) {
      case 'Email':
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Enter a valid email';
        }
        break;
      case 'Phone Number':
        if (!value.startsWith('01') || value.length != 11) {
          return 'Invalid phone';
        }
        break;
      case 'National ID':
        if (value.length != 14 || !RegExp(r'^\d{14}$').hasMatch(value)) {
          return 'Invalid ID';
        }
        break;
      case 'Password':
        if (value.length < 8) return 'At least 8 chars';
        if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) return 'Needs uppercase';
        if (!RegExp(r'(?=.*\d)').hasMatch(value)) return 'Needs number';
        if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
          return 'Needs special char';
        }
        break;
      case 'Confirm Password':
        if (value != cubit.passwordController.text) {
          return 'Passwords do not match';
        }
        break;
    }
    return null;
  }
}
