import 'package:flutter/material.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProfileViewBody());
  }
}
