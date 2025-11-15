// lib/core/di/get_it.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/dio_consumer.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';
import 'package:smart_city/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:smart_city/features/Auth/domain/repos/auth_repo.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_in_cubit.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_up_cubit.dart';
import 'package:smart_city/features/profile/data/repos/profile_repo_imp.dart';
import 'package:smart_city/features/profile/domain/repos/profile_repo.dart';
import 'package:smart_city/features/profile/presentation/manger/cubit/profile_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // SharedPrefe
  final sharedPreferences = await SharedPreferences.getInstance();

  //CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  await CacheHelper.init();

  //  Dio ===
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );
  // 5. AuthRepo
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(authRepository: getIt<AuthRepository>()),
  );
  //  Cubits
  getIt.registerFactory<SignInCubit>(
    () => SignInCubit(authRepository: getIt<AuthRepository>()),
  );
  // ProfileRepo
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(api: getIt<ApiConsumer>()),
  );

  // ProfileCubit
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepo>()),
  );
}
