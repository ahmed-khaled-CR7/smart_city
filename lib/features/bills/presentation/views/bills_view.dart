import 'package:dio/dio.dart';
import 'package:smart_city/core/helper/get_it.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/features/bills/data/repositories/bills_repo_impl.dart';
import 'package:smart_city/features/bills/data/datasources/bill_remote_datasource.dart';
import 'package:smart_city/features/bills/presentation/cubit/bills_cubit.dart';
import 'package:smart_city/features/bills/presentation/views/widgets/bills_view_body.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  static const routeName = 'bills';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BillsCubit(
        BillsRepoImpl(
          BillRemoteDataSourceImpl(di.getIt<Dio>()),
        ),
      )..loadBills(1), 
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF7EF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My Bills',
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
        body: const BillsViewBody(),
      ),
    );
  }
}
