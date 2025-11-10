import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/payment/presentation/views/widgets/payment_confirmation_view_body.dart';

class PaymentConfirmationView extends StatelessWidget {
  const PaymentConfirmationView({super.key});

  static const routeName = 'paymentConfirmation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7EF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Select Payment Method',
          style: TextStyle(
            color: const Color(0xFF0B214A),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.secondaryColor2,
            size: 24.sp,
          ),
        ),
      ),
      body: const PaymentConfirmationViewBody(),
    );
  }
}
