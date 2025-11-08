import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/config/signup_fields_config.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/core/widgets/custom_textformfield.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

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
                ...SignupFieldsConfig.fields.map(
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
                      /// TODO:
                      /// context.read<SignupCubit>().signup();
                    }
                  },
                ),

                SizedBox(height: 18.h),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: AppTextStyles.medium18.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Log in",
                            style: AppTextStyles.medium18.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
