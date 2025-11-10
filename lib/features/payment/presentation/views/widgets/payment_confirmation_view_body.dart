import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/bill_summary_card.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/payment_method_card.dart';

class PaymentConfirmationViewBody extends StatelessWidget {
  const PaymentConfirmationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BillSummaryCard(),
          SizedBox(height: 15.h),
          const PaymentMethodCard(),
          const Spacer(),
          CustomButton(
            text: 'Confirm Payment',
            color: AppColors.secondaryColor,
            textColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
