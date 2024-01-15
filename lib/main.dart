import 'package:flutter/material.dart';
import 'package:kafill/core/routing/app_router.dart';
import 'core/dependency_injecion/di.dart';
import 'kafill_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupApp();
  runApp(KafillApp(
    appRouter: AppRouter(),
  ));
}
