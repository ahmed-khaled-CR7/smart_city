// lib/features/bills/presentation/views/payment_method_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';

class PaymentMethodView extends StatelessWidget {
  final int billId;
  const PaymentMethodView({super.key, required this.billId});

  static const routeName = 'payment-method';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
        backgroundColor: AppColors.secondaryColor2,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _option("Credit/Debit Card", Icons.credit_card),
            const SizedBox(height: 16),
            _option("Mobile Wallet", Icons.phone_iphone),
            const SizedBox(height: 16),
            _option("Bank Transfer", Icons.account_balance),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  context.read<BillsCubit>().payBill(billId);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 80),
                          const SizedBox(height: 16),
                          const Text("Payment Successful!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const Text("Your bill has been marked as paid."),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // قفل الـ dialog
                              Navigator.pop(context); // رجوع للـ Dashboard
                            },
                            child: const Text("Done"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("Confirm Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: AppColors.primaryColor),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}