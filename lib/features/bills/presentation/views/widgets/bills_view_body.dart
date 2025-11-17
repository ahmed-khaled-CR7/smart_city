import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/features/bills/data/models/bill_model.dart';
import 'package:smart_city/features/bills/presentation/cubit/bills_cubit.dart';
import 'package:smart_city/features/bills/presentation/views/widgets/bill_card.dart';
import 'package:smart_city/features/payment/presentation/views/payment_method_view.dart';

class BillsViewBody extends StatelessWidget {
  const BillsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: BlocConsumer<BillsCubit, BillsState>(
        listener: (context, state) {
          if (state is BillsLoaded && state.bills.isEmpty) {
            Navigator.pushNamed(context, PaymentMethodView.routeName);
          }
        },
        builder: (context, state) {
          if (state is BillsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BillsError) {
            return Center(
              child: Text(
                state.msg,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (state is BillsLoaded) {
            final bills = state.bills;

            if (bills.isEmpty) {
              return const Center(
                child: Text("No Bills Found.", style: TextStyle(fontSize: 14, color: Colors.grey)),
              );
            }

            return ListView.separated(
              itemCount: bills.length,
              separatorBuilder: (_, __) => SizedBox(height: 15.h),
              itemBuilder: (context, index) {
                final bill = bills[index] as BillModel;
                final iconData = _iconForService(bill.type);
                final iconColor = _iconColorForService(bill.type);

                return BillCard(
                  id: bill.id,
                  service: bill.type,
                  month: _formatDate(bill.issueDate),
                  amount: "${bill.amount} EGP",
                  icon: iconData,
                  iconColor: iconColor,
                  isPaid: bill.isPaid,
                  onPayPressed:
                      bill.isPaid
                          ? null
                          : () async {
                              context.read<BillsCubit>().pay(bill.id);
                            },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  IconData _iconForService(String type) {
    switch (type.toLowerCase()) {
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

  Color _iconColorForService(String type) {
    switch (type.toLowerCase()) {
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

  String _formatDate(DateTime date) {
    return "${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const names = [
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
    return names[month - 1];
  }
}