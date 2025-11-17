// lib/features/change_password/presentation/views/change_pass.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/features/Change%20password/presentation/manger/cubit/change_password_cubit.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/change_pass_view_body.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});
  static const routeName = 'changePasswordView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangePasswordCubit>(),
      child: Scaffold(
        body: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: ChangePassViewBody(),
          ),
        ),
      ),
    );
  }
}
