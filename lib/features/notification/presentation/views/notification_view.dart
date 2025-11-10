import 'package:flutter/material.dart';
import 'package:smart_city/features/notification/presentation/views/widget/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = 'NotificationView';
  @override
  Widget build(BuildContext context) {
    return NotificationViewBody();
  }
}
