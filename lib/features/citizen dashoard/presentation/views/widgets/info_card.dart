import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/bills/presentation/views/bills_view.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  Widget _infoRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Text(
            value,
            style: TextStyle(
              color: color ?? Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow('This month\'s usage', '350 kWh'),
          _infoRow('Bill amount', '230 EGP'),
          _infoRow('Status', 'Unpaid', color: Colors.red),
          const SizedBox(height: 16),
          CustomButton(
            color: AppColors.primaryColor,
            text: 'pay now',
            onPressed: () {
              Navigator.pushNamed(context, BillsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
