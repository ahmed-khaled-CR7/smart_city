import 'package:flutter/material.dart';
import 'package:smart_city/core/config/gried_view_home_items.dart';
import 'package:smart_city/features/notification/presentation/views/notification_view.dart';
import 'package:smart_city/features/profile/presentation/views/profile_view.dart';

class HomeGridview extends StatelessWidget {
  final Function(int) onNavTap;

  const HomeGridview({super.key, required this.onNavTap});

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      // case 0:
      //   Navigator.pushNamed(context, UtilsView.routeName);
      // break;
      // case 1:
      //   Navigator.pushNamed(context, ComplaintsView.routeName);
      //   break;
      case 2:
        Navigator.pushNamed(context, NotificationView.routeName);
        break;
      case 3:
        Navigator.pushNamed(context, ProfileView.routeName);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: GridViewItems.gridItems.length,
      itemBuilder: (context, index) {
        final item = GridViewItems.gridItems[index];
        return GestureDetector(
          onTap: () => _navigateToPage(context, index),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: (item['color'] as Color).withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    size: 36,
                    color: item['color'] as Color,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item['title'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
