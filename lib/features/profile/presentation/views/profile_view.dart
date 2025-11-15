import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/features/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:smart_city/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..fetchUser(),
      child: const Scaffold(body: ProfileViewBody()),
    );
  }
}
