import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> fields = [
    {
      "title": "Email",
      "hint": "Enter your email",
      "icon": Icons.email,
      "input": TextInputType.emailAddress,
      "obscure": false,
    },
    {
      "title": "Password",
      "hint": "Enter your password",
      "icon": Icons.lock,
      "obscure": true,
    },
    {
      "title": "Confirm Password",
      "hint": "Re-enter your password",
      "icon": Icons.lock,
      "obscure": true,
    },
    {
      "title": "Phone Number",
      "hint": "Enter your phone number",
      "icon": Icons.phone,
      "input": TextInputType.phone,
      "obscure": false,
    },
    {
      "title": "National ID",
      "hint": "Enter your national ID",
      "icon": Icons.perm_identity,
      "input": TextInputType.number,
      "obscure": false,
    },
    {
      "title": "Full Name",
      "hint": "Enter your full name",
      "icon": Icons.person,
      "obscure": false,
    },
    {
      "title": "Address",
      "hint": "Enter your address",
      "icon": Icons.home,
      "obscure": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightprimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightprimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create New Account',
          style: AppTextStyles.bold20.copyWith(color: const Color(0xFF1E1E1E)),
        ),
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              children: [
                ...fields.map(
                  (field) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: CustomTextformField(
                      title: field["title"],
                      hintText: field["hint"],
                      onChanged: (value) {},
                      icon: field["icon"],
                      isobscure: field["obscure"] ?? false,
                      inputType: field["input"] ?? TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                CustomButton(
                  text: 'Create Account',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      /// connect cubit here:
                      /// context.read<SignupCubit>().signup();
                    }
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
