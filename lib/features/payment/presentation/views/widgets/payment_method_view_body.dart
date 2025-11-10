import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/payment/presentation/views/payment_confirmation_view.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody({super.key});

  @override
  State<PaymentMethodViewBody> createState() => _PaymentMethodViewBodyState();
}

class _PaymentMethodViewBodyState extends State<PaymentMethodViewBody> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'title': 'Credit / Debit Card',
      'icon': Icons.credit_card,
      'color': const Color(0xFF009C86),
    },
    {
      'title': 'Vodafone Cash',
      'icon': Icons.phone_android,
      'color': Colors.redAccent,
    },
    {
      'title': 'Fawry',
      'icon': Icons.store_mall_directory,
      'color': Colors.amber,
    },
    {'title': 'Cash Payment', 'icon': Icons.money, 'color': Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          ...List.generate(paymentMethods.length, (index) {
            final method = paymentMethods[index];
            return PaymentMethodItem(
              title: method['title'],
              icon: method['icon'],
              color: method['color'],
              isSelected: selectedIndex == index,
              onTap: () => setState(() => selectedIndex = index),
            );
          }),
          const Spacer(),
          CustomButton(
            text: 'Continue',
            color: AppColors.secondaryColor,
            textColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, PaymentConfirmationView.routeName);
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
