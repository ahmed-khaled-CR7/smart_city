import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/bills/presentation/views/widgets/bill_card.dart';

class BillsViewBody extends StatelessWidget {
  const BillsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = [
      {
        'service': 'Electricity',
        'month': 'February 2025',
        'amount': '120 EGP',
        'icon': Icons.flash_on,
        'iconColor': const Color(0xFFFED766),
        'isPaid': true,
      },
      {
        'service': 'Water',
        'month': 'February 2025',
        'amount': '80 EGP',
        'icon': Icons.water_drop,
        'iconColor': const Color(0xFF90E0EF),
        'isPaid': false,
      },
      {
        'service': 'Gas',
        'month': 'February 2025',
        'amount': '55 EGP',
        'icon': Icons.local_fire_department,
        'iconColor': const Color(0xFFFFB562),
        'isPaid': true,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ListView.separated(
        itemCount: bills.length,
        separatorBuilder: (_, __) => SizedBox(height: 15.h),
        itemBuilder: (context, index) {
          final bill = bills[index];
          return BillCard(
            service: bill['service'] as String,
            month: bill['month'] as String,
            amount: bill['amount'] as String,
            icon: bill['icon'] as IconData,
            iconColor: bill['iconColor'] as Color,
            isPaid: bill['isPaid'] as bool,
          );
        },
      ),
    );
  }
}
