import 'package:flutter/material.dart';
import 'package:smart_city/core/config/gried_view_home_items.dart';

class HomeGridview extends StatelessWidget {
  final void Function(int) onNavTap;

  const HomeGridview({super.key, required this.onNavTap});

  int _mapGridIndexToPageIndex(int gridIndex) {
    switch (gridIndex) {
      case 0:
        return 1;
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = GridViewItems.gridItems;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            final pageIndex = _mapGridIndexToPageIndex(index);
            onNavTap(pageIndex);
          },
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
                    color: item['bgColor'],
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
