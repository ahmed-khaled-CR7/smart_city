import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/features/Auth/domain/repos/auth_repo.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_in_cubit.dart';
import 'package:smart_city/features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(authRepository: getIt<AuthRepository>()),
      child: const LoginViewBody(),
    );
  }
}
