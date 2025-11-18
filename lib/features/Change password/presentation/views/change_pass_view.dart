import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/Change%20password/presentation/manager/cubit/change_password_cubit.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/change_pass_appbar.dart';
import 'package:smart_city/features/Change%20password/presentation/views/widgets/change_pass_view_body.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});
  static const String routeName = 'changePasswordView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangePasswordCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.lightprimaryColor,
        appBar: const ChangePasswordAppBar(),
        body: const SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ChangePassViewBody(),
          ),
        ),
      ),
    );
  }
}
