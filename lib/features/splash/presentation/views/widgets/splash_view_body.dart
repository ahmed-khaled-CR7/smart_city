import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/helper/secure_storage_helper.dart';
import 'package:smart_city/core/services/shared_pref_singleton.dart';
import 'package:smart_city/features/Auth/presentation/views/signup_view.dart';
import 'package:smart_city/features/onboarding/presentation/views/onboarding_view.dart';
import 'animated_logo.dart';
import 'animated_background.dart';
import 'animated_texts.dart';
import 'loading_indicator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late AnimationController _pulseController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateNext();
  }

  void _setupAnimations() {
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _scaleController.forward();
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _navigateNext() async {
    final isOnboardingSeen = Prefs.getBool('isOnboardingSeen') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final token = await SecureStorageHelper.getToken();
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/main');
    } else if (!isOnboardingSeen) {
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, SignupView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBackground(pulseAnimation: _pulseAnimation),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                AnimatedLogo(
                  scaleAnimation: _scaleAnimation,
                  pulseAnimation: _pulseAnimation,
                ),
                SizedBox(height: 40.h),
                AnimatedTexts(fadeAnimation: _fadeAnimation),
                const Spacer(flex: 2),
                LoadingIndicator(fadeAnimation: _fadeAnimation),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
