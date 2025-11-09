import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_city/core/utils/app_text_styls.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool _showAnimation = false;
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) async {
        setState(() {
          _isPressed = false;
          _showAnimation = true;
        });
        await Future.delayed(const Duration(milliseconds: 1300));

        setState(() => _showAnimation = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          AnimatedScale(
            scale: _isPressed ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            child: Container(
              width: 384.w,
              height: 56.h,
              decoration: ShapeDecoration(
                color: widget.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: -2,
                  ),
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold18.copyWith(
                    color: widget.textColor ?? Colors.white,
                    height: 1.50,
                    letterSpacing: 0.27,
                  ),
                ),
              ),
            ),
          ),

          if (_showAnimation)
            Positioned(
              top: -40,
              child: Lottie.asset(
                'assets/animations/Sparkles.json',
                width: 150,
                height: 150,
                repeat: false,
              ),
            ),
        ],
      ),
    );
  }
}
