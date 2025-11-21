// lib/features/notification/presentation/views/notification_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/notification/presentation/manger/cubit/notification_cubit.dart';
import 'package:smart_city/features/notification/presentation/views/widget/notification_view_body.dart';
import 'package:smart_city/features/profile/presentation/manager/cubit/profile_cubit.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const String routeName = 'notifications';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<NotificationCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()..fetchUser()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.lightprimaryColor,
        body: NotificationViewBody(),
      ),
    );
  }
}
