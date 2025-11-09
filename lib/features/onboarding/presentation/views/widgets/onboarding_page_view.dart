import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/services/shared_pref_singleton.dart';
import 'package:smart_city/features/Auth/presentation/views/signup_view.dart';
import 'package:smart_city/features/onboarding/presentation/views/widgets/onboarding_pageview_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.currentPage,
  });

  final PageController pageController;
  final Function(int) onPageChanged;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: [
        OnboardingPageviewItem(
          animation: 'assets/animations/onboarding1.json',

          title: 'Welcome to Smart City',
          subtitle:
              'Access services, report issues\nand stay connected with your community',
          isLastPage: false,
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        OnboardingPageviewItem(
          animation: 'assets/animations/onboardin2.json',

          title: 'Advanced Services',
          subtitle:
              'Enjoy smart and advanced services\nthat make your daily life easier',
          isLastPage: false,
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        OnboardingPageviewItem(
          animation: 'assets/animations/onboarding3.json',

          title: 'Stay Connected',
          subtitle:
              'Report issues and stay in touch with your community easily',
          isLastPage: true,
          onPressed: () {
            Prefs.setBool('isonBoardingSeen', true);
            Navigator.pushReplacementNamed(context, SignupView.routeName);
          },
        ),
      ],
    );
  }
}
