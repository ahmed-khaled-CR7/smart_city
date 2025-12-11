// lib/features/bills/presentation/views/widgets/bill_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';
import 'package:smart_city/features/bills/presentation/views/bill_details_view.dart';
import 'package:smart_city/features/bills/presentation/views/widgets/status_text.dart';
import 'package:smart_city/features/bills/presentation/views/widgets/view_details_button.dart';

class BillCard extends StatelessWidget {
  final String service;
  final String month;
  final String amount;
  final IconData icon;
  final Color iconColor;
  final bool isPaid;
  final int id;

  const BillCard({
    super.key,
    required this.service,
    required this.month,
    required this.amount,
    required this.icon,
    required this.iconColor,
    required this.isPaid,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Service Name + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service,
                style: TextStyle(
                  color: const Color(0xFF0B214A),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: iconColor.withOpacity(0.2),
                child: Icon(icon, color: iconColor, size: 24.sp),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Month + Amount
          Text(
            '$month - $amount',
            style: TextStyle(
              color: const Color(0xFF0B214A),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),

          // Status + View Details Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusText(isPaid: isPaid),
              ViewDetailsButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    BillDetailsView.routeName,
                    arguments: {
                      'id': id,
                      'service': service,
                      'month': month,
                      'amount': amount,
                      'isPaid': isPaid,
                    },
                  );

                  if (result == true) {
                    context.read<BillsCubit>().getMyBills(1);
                  }
                },
              ),
            ],
          ),

          // Pay Now Button (ظاهر بس لو الفاتورة مش مدفوعة)
          if (!isPaid)
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // ده اللي هيطلّع الـ Dialog الجميل فورًا
                    context.read<BillsCubit>().emit(BillPaymentSuccess());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B214A),
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}