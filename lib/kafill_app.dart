import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/dependency_injecion/di.dart';
import 'package:kafill/features/home/cubit/home_cubit.dart';
import 'package:kafill/features/login/cubit/login_cubit.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/presentation/register_layout.dart';
import 'package:kafill/features/splash/cubit/splash_cubit.dart';
import 'package:kafill/features/whoAmI/cubit/who_am_i_cubit.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';
import 'core/theme/colors.dart';

class KafillApp extends StatefulWidget {
  final AppRouter appRouter;
  const KafillApp({super.key, required this.appRouter});

  @override
  State<KafillApp> createState() => _KafillAppState();
}

class _KafillAppState extends State<KafillApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<RegisterCubit>(
              create: (context)=>getIt<RegisterCubit>(),

            ) ,
            BlocProvider<LoginCubit>(
              create: (context)=>getIt<LoginCubit>()),

           BlocProvider<SplashCubit>(
              create: (context)=>getIt<SplashCubit>()..getDependencies(),
            ),

           BlocProvider<HomeCubit>(
              create: (context)=>getIt<HomeCubit>()),

           BlocProvider<WhoAmICubit>(
              create: (context)=>getIt<WhoAmICubit>(),
            )
          ],
          child: MaterialApp(
            title: 'Kafill App',
            theme: ThemeData(
              actionIconTheme: ActionIconThemeData(
                backButtonIconBuilder: (BuildContext context) => IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon:const Icon(Icons.arrow_back_ios),
                ),
              ),

              appBarTheme: const AppBarTheme(
                  backgroundColor:Colors.transparent,
                  // titleSpacing:,
                  elevation: 0.0,
                 iconTheme: IconThemeData(
                  color: Colors.black,
                )
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: widget.appRouter.generateRoute,
          ),
        ));
  }
}
