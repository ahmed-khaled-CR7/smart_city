import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/complaints_view_body.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  static const routeName = 'complaints';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7EF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Submit Complaint or Suggestion',
          style: TextStyle(
            color: AppColors.secondaryColor2,
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
      body: const ComplaintsViewBody(),
    );
  }
}
