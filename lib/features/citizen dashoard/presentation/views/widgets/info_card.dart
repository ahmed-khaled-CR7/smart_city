// lib/features/citizen_dashoard/presentation/views/widgets/info_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';

class InfoCard extends StatelessWidget {
  final String serviceType;

  const InfoCard({super.key, required this.serviceType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillsCubit, BillsState>(
      builder: (context, state) {
        final cubit = context.read<BillsCubit>();

        final bill = serviceType == "electricity"
            ? cubit.currentElectricityBill
            : cubit.currentWaterBill;

        final double amount = bill?.amount ?? 0.0;
        final bool isUnpaid = bill != null && !bill.isPaid;
        final String usage = serviceType == "electricity" ? "350 kWh" : "85 m³";
        final Color amountColor = isUnpaid ? Colors.red[700]! : Colors.green[700]!;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("This month's usage",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey[700])),
                SizedBox(height: 8.h),
                Text(usage,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFB800))),

                SizedBox(height: 24.h),

                Text("Bill amount",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey[700])),
                SizedBox(height: 8.h),
                Text(
                  isUnpaid ? "${amount.toStringAsFixed(2)} EGP" : "Paid",
                  style: TextStyle(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.bold,
                      color: amountColor),
                ),

                SizedBox(height: 16.h),

                Text("Status: ${isUnpaid ? "Unpaid" : "Paid"}",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: amountColor)),

                if (isUnpaid) ...[
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Pay Now',
                      color: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/payment-method',
                          arguments: bill.id,
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}