// lib/features/Auth/presentation/views/signup_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/features/Auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(authRepository: getIt<AuthRepository>()),
      child: const SignupViewBody(),
    );
  }
}
