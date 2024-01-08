import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafill/core/routing/routers.dart';
import 'package:kafill/features/login/presentation/login_screen.dart';
import 'package:kafill/features/register/cubit/register_cubit.dart';
import 'package:kafill/features/register/presentation/register_screen.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../dependency_injecion/di.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
     case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
              create: (context)=>getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
