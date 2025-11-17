import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/bills/presentation/views/bill_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/features/bills/presentation/cubit/bills_cubit.dart';
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
    required this.id, Future<Null> Function()? onPayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                child: Icon(icon, color: iconColor, size: 22.sp),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            '$month - $amount',
            style: TextStyle(
              color: const Color(0xFF0B214A),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
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
                    // reload bills list after successful payment
                    try {
                      context.read<BillsCubit>().loadBills(1);
                    } catch (_) {}
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
