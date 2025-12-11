import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_city/core/helper/get_it.dart';
import 'package:smart_city/core/helper/on_generate_routes.dart';
import 'package:smart_city/core/services/custom_bloc_observer.dart';
import 'package:smart_city/core/services/shared_pref_singleton.dart';
import 'package:smart_city/core/utils/app_colors.dart';

// Profile Cubit
import 'package:smart_city/features/profile/presentation/manager/cubit/profile_cubit.dart';

// Complaints Cubit
import 'package:smart_city/features/complaints/presentation/cubit/complaints_cubit.dart';

// Bills Cubit
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';

import 'package:smart_city/features/complaints/presentation/views/complaint_details_view.dart';

import 'features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  setupGetIt();
  runApp(const SmartCity());
}

class SmartCity extends StatelessWidget {
  const SmartCity({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProfileCubit>(
              create: (_) => getIt<ProfileCubit>(),
            ),

            BlocProvider<ComplaintsCubit>(
              create: (_) => getIt<ComplaintsCubit>(),
            ),

            // Bills Cubit
            BlocProvider<BillsCubit>(
              create: (_) => getIt<BillsCubit>()..getMyBills(1),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: AppColors.lightprimaryColor,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),

            onGenerateRoute: onGenerateRoute,

            initialRoute: SplashView.routeName,
          ),
        );
      },
    );
  }
}