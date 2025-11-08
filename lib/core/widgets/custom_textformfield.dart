import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  const CustomTextformField({
    super.key,
    this.inputType,
    this.onChanged,
    this.title,
    this.icon,
    this.hintText = '',
    this.isobscure = false,
    this.validator,
    this.controller,
  });

  final TextInputType? inputType;
  final String hintText;
  final String? title;
  final Function(String)? onChanged;
  final bool isobscure;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                title!,
                style: const TextStyle(
                  color: Color(0xff1E1E1E),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          TextFormField(
            controller: controller,
            keyboardType: inputType,
            obscureText: isobscure,
            obscuringCharacter: '*',
            style: const TextStyle(color: Color(0xff5C5C5C)),
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              prefixIcon: icon != null ? Icon(icon, size: 24) : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 60,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xff5C5C5C),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD1D5DB),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xFF3AAFA9),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
