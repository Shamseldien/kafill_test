import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafill/core/helpers/caching_helper.dart';
import 'package:kafill/core/network/api_services.dart';
import 'package:kafill/core/network/dio_factroy.dart';
import 'package:kafill/features/home/cubit/home_cubit.dart';
import 'package:kafill/features/login/cubit/login_cubit.dart';
import 'package:kafill/features/login/data/repositories/login_repo.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
 import 'package:kafill/features/register/data/repositories/register_repo.dart';
import 'package:kafill/features/splash/cubit/splash_cubit.dart';
import 'package:kafill/features/splash/repositories/splash_repo.dart';
import 'package:kafill/features/whoAmI/cubit/who_am_i_cubit.dart';
import 'package:kafill/features/whoAmI/data/repositories/who_am_i_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupApp() async {



  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // splash
  getIt.registerLazySingleton<SplashRepo>(() => SplashRepo(getIt()));
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt()));


  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(),));

  // register
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));

  // who am i
  getIt.registerLazySingleton<WhoAmICubit>(() => WhoAmICubit(getIt()));
  getIt.registerLazySingleton<WhoAmIRepo>(() => WhoAmIRepo(getIt()));


  // Home
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());

 // caching
  getIt.registerLazySingletonAsync<SharedPreferences>(() async {
    return  await SharedPreferences.getInstance();
  });

  await GetIt.instance.isReady<SharedPreferences>();
  getIt.registerLazySingleton<CacheManager>(() => CacheManager(getIt()));

}
