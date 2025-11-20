import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/core/utils/page_view.dart';
import 'package:smart_city/core/widgets/bottom_nav_bar.dart';
import 'package:smart_city/features/profile/presentation/manager/cubit/profile_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final PageController _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _navController = NotchBottomBarController(
    index: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileCubit>()..fetchUser()),
      ],
      child: Scaffold(
        extendBody: true,
        body: HomePagesView(
          pageController: _pageController,
          onPageChanged: (index) {
            _navController.index = index;
            setState(() {});
          },
          onNavTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          controller: _navController,
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
