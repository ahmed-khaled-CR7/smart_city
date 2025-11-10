import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(title, style: TextStyle(color: color)),
      leading: Icon(icon, color: color),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
