import 'package:flutter/material.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static const routeName = 'editProfile';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EditProfileViewBody());
  }
}