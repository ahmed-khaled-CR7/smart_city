// lib/core/di/get_it.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/dio_consumer.dart';
import 'package:smart_city/core/database/cache/cache_helper.dart';
import 'package:smart_city/features/Auth/data/repos/auth_repo_imp.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_in_cubit.dart';
import 'package:smart_city/features/Auth/presentation/mannger/cubit/sign_up_cubit.dart';
import 'package:smart_city/features/Auth/presentation/views/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // === 1. SharedPreferences ===
  final sharedPreferences = await SharedPreferences.getInstance();

  // === 2. CacheHelper (Singleton) ===
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  await CacheHelper.init(); // ← إجباري

  // === 3. Dio ===
  final dio = Dio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // === 4. ApiConsumer (DioConsumer) ===
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>(), prefs: sharedPreferences),
  );
  // 5. AuthRepository (المهم!)
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(authRepository: getIt<AuthRepository>()),
  );
  // === 6. Cubits (Factory) ===
  getIt.registerFactory<SignInCubit>(
    () => SignInCubit(authRepository: getIt<AuthRepository>()),
  );
}
