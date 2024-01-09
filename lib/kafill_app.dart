import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';
import 'core/theme/colors.dart';

class KafillApp extends StatelessWidget {
  final AppRouter appRouter;
  const KafillApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
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
                titleSpacing: 0,
                elevation: 0.0,
               iconTheme: IconThemeData(
                color: Colors.black,
              )
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
