import 'package:bouselwawa/core/helpers/strings.dart';
import 'package:bouselwawa/core/routing/app_router.dart';
import 'package:bouselwawa/core/routing/routes.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bouselwawa extends StatelessWidget {
  final AppRouter appRouter ;
  const Bouselwawa({super.key, required this.appRouter});
 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: ColorsManager.primaryColorTeal,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onboarding,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}