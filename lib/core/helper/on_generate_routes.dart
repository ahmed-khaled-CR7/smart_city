import 'package:flutter/material.dart';
import 'package:smart_city/features/Auth/presentation/views/login_view.dart';
import 'package:smart_city/features/Auth/presentation/views/signup_view.dart';
import 'package:smart_city/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:smart_city/features/profile/presentation/views/edit_profile_view.dart';
import 'package:smart_city/features/profile/presentation/views/profile_view.dart';
import 'package:smart_city/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const EditProfileView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
