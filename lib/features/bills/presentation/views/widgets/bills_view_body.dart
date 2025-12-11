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
          // Dialog الدفع الناجح
          if (state is BillPaymentSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.all(30.w),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 90.w,
                      height: 90.w,
                      decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                      child: const Icon(Icons.check, color: Colors.white, size: 56),
                    ),
                    SizedBox(height: 24.h),
                    const Text(
                      "Bill Paid Successfully!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0B214A)),
                    ),
                    SizedBox(height: 12.h),
                    const Text(
                      "Thank you for your payment.\nYour bill has been marked as paid.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        // تحديث القايمة بعد الدفع
                        context.read<BillsCubit>().getMyBills(1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0B214A),
                        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 16.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      ),
                      child: const Text("Done", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is BillPaymentError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          if (state is BillsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BillsError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }

          if (state is BillsLoaded) {
            final cubit = context.read<BillsCubit>();
            final electricityBill = cubit.currentElectricityBill;
            final waterBill = cubit.currentWaterBill;

            return ListView(
              children: [
                // كارت الكهرباء (لو موجودة وغير مدفوعة)
                if (electricityBill != null) ...[
                  _buildDashboardCard(
                    context: context,
                    title: "Electricity Bill",
                    usage: "350 kWh",
                    amount: electricityBill.amount,
                    color: const Color(0xFFFED766),
                    icon: Icons.flash_on,
                    billId: electricityBill.id,
                  ),
                  SizedBox(height: 16.h),
                ],

                // كارت المياه (لو موجودة وغير مدفوعة)
                if (waterBill != null) ...[
                  _buildDashboardCard(
                    context: context,
                    title: "Water Bill",
                    usage: "85 m³",
                    amount: waterBill.amount,
                    color: const Color(0xFF90E0EF),
                    icon: Icons.water_drop,
                    billId: waterBill.id,
                  ),
                  SizedBox(height: 16.h),
                ],

                // باقي الفواتير (كل الفواتير حتى المدفوعة)
                if (state.bills.isNotEmpty)
                  ...state.bills.map((bill) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: BillCard(
                      id: bill.id,
                      service: bill.type ?? "Bill",
                      month: _formatDate(bill.issueDate),
                      amount: "${bill.amount.toStringAsFixed(2)} EGP",
                      icon: _iconForService(bill.type),
                      iconColor: _iconColorForService(bill.type),
                      isPaid: bill.isPaid,
                    ),
                  )),

                // لو مفيش أي فواتير خالص (حتى مدفوعة)
                if (state.bills.isEmpty && electricityBill == null && waterBill == null)
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.receipt_long, size: 80, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("No bills available at the moment"),
                      ],
                    ),
                  ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  // كارت الـ Dashboard الكبير
  Widget _buildDashboardCard({
    required BuildContext context,
    required String title,
    required String usage,
    required double amount,
    required Color color,
    required IconData icon,
    required int billId,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.2), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF0B214A))),
                CircleAvatar(backgroundColor: color.withOpacity(0.3), child: Icon(icon, color: color, size: 28.sp)),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("This month's usage", style: TextStyle(color: Colors.grey[700])),
                  Text(usage, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text("Bill amount", style: TextStyle(color: Colors.grey[700])),
                  Text("${amount.toStringAsFixed(2)} EGP",
                      style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.red[700])),
                ]),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // التعديل المهم: نستخدم payBill الحقيقي مش emit بس
                onPressed: () => context.read<BillsCubit>().payBill(billId),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B214A),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                ),
                child: const Text("Pay Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // باقي الدوال (ما تغيرهاش)
  IconData _iconForService(String? type) {
    switch (type?.toLowerCase()) {
      case 'electricity': return Icons.flash_on;
      case 'water': return Icons.water_drop;
      default: return Icons.receipt_long;
    }
  }

  Color _iconColorForService(String? type) {
    switch (type?.toLowerCase()) {
      case 'electricity': return const Color(0xFFFED766);
      case 'water': return const Color(0xFF90E0EF);
      default: return Colors.blueGrey;
    }
  }

  String _formatDate(DateTime date) {
    const months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
    return "${months[date.month - 1]} ${date.year}";
  }
}