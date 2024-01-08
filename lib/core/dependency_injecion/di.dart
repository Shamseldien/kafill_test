import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafill/core/network/api_services.dart';
import 'package:kafill/core/network/dio_factroy.dart';
import 'package:kafill/features/login/cubit/login_cubit.dart';
import 'package:kafill/features/login/data/repositories/login_repo.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupApp() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // register
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit());
}
