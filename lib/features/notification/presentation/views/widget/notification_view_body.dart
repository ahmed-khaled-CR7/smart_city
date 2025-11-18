import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/features/notification/presentation/manger/cubit/notification_cubit.dart';
import 'package:smart_city/features/notification/presentation/manger/cubit/notification_state.dart';
import 'package:smart_city/features/notification/presentation/views/widget/delete_notfi.dart';
import 'package:smart_city/features/notification/presentation/views/widget/notifcation_snackbar.dart';
import 'package:smart_city/features/notification/presentation/views/widget/notification_card.dart';
import 'package:smart_city/features/profile/presentation/manager/cubit/profile_cubit.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileState = context.read<ProfileCubit>().state;

      if (profileState is ProfileSuccess) {
        context.read<NotificationCubit>().fetchMyNotifications(
          profileState.user.id,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppbar(
          title: 'Notifications',
          icon: Icons.notifications_active,
          color: Colors.white,
          backgroundColor: AppColors.secondaryColor2,
        ),
        Expanded(child: _NotificationList()),
      ],
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is NotificationDeleted) {
          NotificationSnackbar.show(
            context,
            message: state.message,
            backgroundColor: Colors.green,
          );
        }

        if (state is NotificationFailure) {
          NotificationSnackbar.show(
            context,
            message: state.message,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is NotificationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NotificationSuccess) {
          final notifications = state.notifications;

          if (notifications.isEmpty) {
            return const Center(
              child: Text(
                'there is no notifications right now   ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notif = notifications[index];

              return Dismissible(
                key: Key('notif_${notif.id}'),
                direction: DismissDirection.endToStart,
                background: const DeleteBackground(isLeft: true),
                confirmDismiss: (_) async {
                  await context.read<NotificationCubit>().deleteNotification(
                    notif.id,
                  );
                  return true;
                },
                child: NotificationCard(
                  title: notif.title,
                  message: notif.message,
                  date: notif.date,
                  isRead: notif.isRead,
                  backgroundColor: Colors.white,
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
