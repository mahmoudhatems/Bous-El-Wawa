import 'package:bouselwawa/bouselwawa.dart';
import 'package:bouselwawa/core/di/dependancy_injection.dart';
import 'package:bouselwawa/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([ScreenUtil.ensureScreenSize(), setupGetIt()]);
  runApp(Bouselwawa(
    appRouter: AppRouter(),
  ));
  FlutterNativeSplash.remove();
  print("main_dev");
}
