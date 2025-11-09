import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';

class AnimatedBackground extends StatelessWidget {
  final Animation<double> pulseAnimation;

  const AnimatedBackground({super.key, required this.pulseAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.lightprimaryColor,
                AppColors.primaryColor.withOpacity(0.1 * pulseAnimation.value),
                AppColors.lightprimaryColor,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
    );
  }
}
