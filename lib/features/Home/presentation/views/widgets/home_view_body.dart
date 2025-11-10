import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/bottom_nav_bar.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/features/Home/presentation/views/widgets/home_gridView.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final PageController _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _navController = NotchBottomBarController(
    index: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        backgroundColor: AppColors.secondaryColor2,
        title: 'Smart City',

        icon: Icons.home_filled,
        color: Colors.white,
      ),
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [_buildHomePage()],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        controller: _navController,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            HomeGridview(onNavTap: _onNavTap),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
