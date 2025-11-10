import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_appbar.dart';
import 'package:smart_city/features/notification/presentation/views/widget/delete_notfi.dart';
import 'package:smart_city/features/notification/presentation/views/widget/notifcation_snackbar.dart';
import 'package:smart_city/features/notification/presentation/views/widget/notification_card.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  final List<String> _notifications = List.generate(
    5,
    (index) => 'Notification ${index + 1}',
  );

  void _removeNotification(int index) {
    final removedItem = _notifications[index];
    setState(() => _notifications.removeAt(index));

    NotificationSnackbar.show(context, message: '$removedItem removed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Notifications',
        icon: Icons.notifications,
        color: Colors.white,
        backgroundColor: AppColors.secondaryColor2,
      ),
      backgroundColor: AppColors.lightprimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            itemCount: _notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              return Dismissible(
                key: Key(notification),
                direction: DismissDirection.horizontal,
                onDismissed: (_) => _removeNotification(index),
                background: const DeleteBackground(isLeft: true),
                secondaryBackground: const DeleteBackground(isLeft: false),
                child: NotificationCard(title: notification),
              );
            },
          ),
        ),
      ),
    );
  }
}
