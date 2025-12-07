// lib/features/bills/presentation/views/widgets/bills_view_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/bills/data/models/bill_model.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';
import 'package:smart_city/features/bills/presentation/views/widgets/bill_card.dart';

class BillsViewBody extends StatelessWidget {
  const BillsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: BlocConsumer<BillsCubit, BillsState>(
        listener: (context, state) {
          if (state is BillPaymentSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Bill paid successfully!"),
                backgroundColor: Colors.green,
              ),
            );
          }

          if (state is BillPaymentError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BillsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BillsError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is BillsLoaded) {
            final List<BillModel> bills = state.bills;

            if (bills.isEmpty) {
              return const Center(
                child: Text(
                  "No bills available at the moment",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            return ListView.separated(
              itemCount: bills.length,
              separatorBuilder: (_, __) => SizedBox(height: 15.h),
              itemBuilder: (context, index) {
                final bill = bills[index];

                return BillCard(
                  id: bill.id,
                  service: bill.type ?? "Bill",
                  month: _formatDate(bill.issueDate),
                  amount: "${bill.amount.toStringAsFixed(2)} EGP",
                  icon: _iconForService(bill.type),
                  iconColor: _iconColorForService(bill.type),
                  isPaid: bill.isPaid,
                  onPayPressed:
                      bill.isPaid
                          ? null
                          : () => context.read<BillsCubit>().payBill(bill.id),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  IconData _iconForService(String? type) {
    switch (type?.toLowerCase()) {
      case 'electricity':
        return Icons.flash_on;
      case 'water':
        return Icons.water_drop;
      case 'gas':
        return Icons.local_fire_department;
      default:
        return Icons.receipt_long;
    }
  }

  Color _iconColorForService(String? type) {
    switch (type?.toLowerCase()) {
      case 'electricity':
        return const Color(0xFFFED766);
      case 'water':
        return const Color(0xFF90E0EF);
      case 'gas':
        return const Color(0xFFFFB562);
      default:
        return Colors.blueGrey;
    }
  }

  // Corrected: now accepts DateTime instead of String
  String _formatDate(DateTime date) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    return "${months[date.month - 1]} ${date.year}";
  }
}
