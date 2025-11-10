import 'package:flutter/material.dart';
import 'package:smart_city/features/Auth/presentation/views/login_view.dart';
import 'package:smart_city/features/Auth/presentation/views/signup_view.dart';
import 'package:smart_city/features/Home/presentation/views/home_view.dart';
import 'package:smart_city/features/bills/presentation/views/bill_details_view.dart';
import 'package:smart_city/features/bills/presentation/views/bills_view.dart';
import 'package:smart_city/features/complaints/presentation/views/complaints_view.dart';
import 'package:smart_city/features/notification/presentation/views/notification_view.dart';
import 'package:smart_city/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:smart_city/features/payment/presentation/views/payment_confirmation_view.dart';
import 'package:smart_city/features/payment/presentation/views/payment_method_view.dart';
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
    case PaymentMethodView.routeName:
      return MaterialPageRoute(builder: (context) => const PaymentMethodView());
    case PaymentConfirmationView.routeName:
      return MaterialPageRoute(builder: (context) => const PaymentConfirmationView());
    case homeView.routeName:
      return MaterialPageRoute(builder: (context) => const homeView());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (context) => const NotificationView());
    case BillsView.routeName:
      return MaterialPageRoute(builder: (context) => const BillsView());
    case BillDetailsView.routeName:
      return MaterialPageRoute(builder: (context) => const BillDetailsView());
    case ComplaintsView.routeName:
      return MaterialPageRoute(builder: (context) => const ComplaintsView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
