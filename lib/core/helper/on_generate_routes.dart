import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/main_layout.dart';
import 'package:smart_city/features/Auth/presentation/views/login_view.dart';
import 'package:smart_city/features/Auth/presentation/views/signup_view.dart';
import 'package:smart_city/features/Change%20password/presentation/views/change_pass_view.dart';
import 'package:smart_city/features/Home/presentation/views/home_view.dart';
import 'package:smart_city/features/bills/presentation/views/bill_details_view.dart';
import 'package:smart_city/features/bills/presentation/views/bills_view.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/citizen_dashboard_view.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/electricty_dashboard_view.dart';
import 'package:smart_city/features/citizen%20dashoard/presentation/views/water_dashboard_view.dart';
import 'package:smart_city/features/complaints/presentation/views/complaints_view.dart';
import 'package:smart_city/features/notification/presentation/views/notification_view.dart';
import 'package:smart_city/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:smart_city/features/payment/presentation/views/payment_confirmation_view.dart';
import 'package:smart_city/features/payment/presentation/views/payment_method_view.dart';
import 'package:smart_city/features/profile/presentation/views/profile_view.dart';
import 'package:smart_city/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnboardingView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileView());

    case PaymentMethodView.routeName:
      return MaterialPageRoute(builder: (_) => const PaymentMethodView());

    case PaymentConfirmationView.routeName:
      return MaterialPageRoute(builder: (_) => const PaymentConfirmationView());

    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => HomeView(onNavTap: (int index) {}),
      );

    case NotificationView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationView());

    case BillsView.routeName:
      return MaterialPageRoute(builder: (_) => const BillsView());

    case BillDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const BillDetailsView());

    case ComplaintsView.routeName:
      return MaterialPageRoute(builder: (_) => const ComplaintsView());
    case CitizenDashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const CitizenDashboardView());
    case ElectricityDashboardView.routeName:
      return MaterialPageRoute(
        builder: (_) => const ElectricityDashboardView(),
      );
    case WaterDashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const WaterDashboardView());
    case '/main':
      return MaterialPageRoute(builder: (_) => const MainLayout());
    case ChangePassView.routeName:
      return MaterialPageRoute(builder: (_) => const ChangePassView());
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
