import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/complaints/presentation/views/complaints_view.dart';
import 'package:smart_city/features/payment/presentation/views/payment_method_view.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/label_value_row.dart';

class BillDetailsViewBody extends StatelessWidget {
  const BillDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Card(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelValueRow(
                      label: 'Service Type',
                      value: 'Electricity',
                    ),
                    SizedBox(height: 10.h),
                    const LabelValueRow(
                      label: 'Issue Date',
                      value: '24/08/2024',
                    ),
                    Divider(height: 25.h, color: Colors.grey.shade300),
                    const LabelValueRow(
                      label: 'Total Amount',
                      value: 'EGP 350.00',
                      isAmount: true,
                    ),
                    Divider(height: 25.h, color: Colors.grey.shade300),
                    const LabelValueRow(label: 'Status', value: 'Paid'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 35.h),
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(milliseconds: 600),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Pay Now',
                    color: AppColors.primaryColor,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, PaymentMethodView.routeName);
                    },
                  ),
                  SizedBox(height: 15.h),
                  CustomButton(
                    text: 'Report a Problem',
                    color: Colors.white,
                    textColor: AppColors.secondaryColor,
                    onPressed: () {
                      Navigator.pushNamed(context, ComplaintsView.routeName);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening complaint form...'),
                          backgroundColor: Colors.orangeAccent,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
