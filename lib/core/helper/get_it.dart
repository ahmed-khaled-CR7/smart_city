import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/dio_consumer.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';

import 'package:smart_city/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:smart_city/features/Auth/domain/repos/auth_repo.dart';
import 'package:smart_city/features/Auth/presentation/manager/cubit/sign_in_cubit.dart';
import 'package:smart_city/features/Auth/presentation/manager/cubit/sign_up_cubit.dart';

import 'package:smart_city/features/Change password/data/repos/change_pass_repo_imp.dart';
import 'package:smart_city/features/Change password/domain/repos/change_pass_repo.dart';
import 'package:smart_city/features/Change password/presentation/manager/cubit/change_password_cubit.dart';

// Bills Imports
import 'package:smart_city/features/bills/data/repositories/bills_repo_impl.dart';
import 'package:smart_city/features/bills/domain/repositories/bills_repo.dart';
import 'package:smart_city/features/bills/presentation/manager/cubit/bills_cubit.dart';

import 'package:smart_city/features/notification/data/repos/notification_repo_imp.dart';
import 'package:smart_city/features/notification/domain/repos/notification_repo.dart';
import 'package:smart_city/features/notification/presentation/manger/cubit/notification_cubit.dart';

import 'package:smart_city/features/complaints/data/datasources/complaint_remote_datasource.dart';
import 'package:smart_city/features/complaints/data/repositories/complaint_repo_impl.dart';
import 'package:smart_city/features/complaints/domain/repositories/complaint_repo.dart';
import 'package:smart_city/features/complaints/domain/usecases/create_complaint_usecase.dart';
import 'package:smart_city/features/complaints/domain/usecases/get_my_complaints_usecase.dart';
import 'package:smart_city/features/complaints/presentation/cubit/complaints_cubit.dart';

import 'package:smart_city/features/profile/data/repos/profile_repo_imp.dart';
import 'package:smart_city/features/profile/domain/repos/profile_repo.dart';
import 'package:smart_city/features/profile/presentation/manager/cubit/profile_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper(sharedPreferences));
  await CacheHelper.init();

  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // API Consumer
  getIt.registerLazySingleton<ApiConsumer>(
        () => DioConsumer(dio: getIt<Dio>()),
  );

  // Auth
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<SignUpCubit>(
        () => SignUpCubit(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<SignInCubit>(
        () => SignInCubit(authRepository: getIt<AuthRepository>()),
  );

  // Profile
  getIt.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ProfileCubit>(
        () => ProfileCubit(getIt<ProfileRepo>()),
  );

  // Change Password
  getIt.registerLazySingleton<ChangePasswordRepo>(
        () => ChangePasswordRepoImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<ChangePasswordCubit>(
        () => ChangePasswordCubit(repo: getIt<ChangePasswordRepo>()),
  );

  // Bills
  getIt.registerLazySingleton<BillsRepository>(
        () => BillsRepoImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<BillsCubit>(
        () => BillsCubit(getIt<BillsRepository>()),
  );

  // Complaints
  getIt.registerLazySingleton<ComplaintRemoteDataSource>(
        () => ComplaintRemoteDataSourceImpl(getIt<ApiConsumer>()), // ⬅ التعديل المهم
  );

  getIt.registerLazySingleton<ComplaintRepository>(
        () => ComplaintRepoImpl(getIt<ComplaintRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetMyComplaintsUseCase>(
        () => GetMyComplaintsUseCase(getIt<ComplaintRepository>()),
  );

  getIt.registerLazySingleton<CreateComplaintUseCase>(
        () => CreateComplaintUseCase(getIt<ComplaintRepository>()),
  );

  getIt.registerFactory<ComplaintsCubit>(
        () => ComplaintsCubit(
      getMyComplaintsUseCase: getIt<GetMyComplaintsUseCase>(),
      createComplaintUseCase: getIt<CreateComplaintUseCase>(),
    ),
  );

  // Notifications
  getIt.registerLazySingleton<NotificationRepository>(
        () => NotificationRepoImp(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<NotificationCubit>(
        () => NotificationCubit(getIt<NotificationRepository>()),
  );
}
