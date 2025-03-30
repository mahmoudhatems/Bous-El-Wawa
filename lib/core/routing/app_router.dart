import 'package:bouselwawa/Features/home/ui/home_Screen.dart';
import 'package:bouselwawa/Features/login/logic/cubit/login_cubit.dart';
import 'package:bouselwawa/Features/login/login_screen.dart';
import 'package:bouselwawa/Features/onboarding/onboarding_screen.dart';
import 'package:bouselwawa/Features/register/ui/register_screen.dart';
import 'package:bouselwawa/core/di/dependancy_injection.dart';
import 'package:bouselwawa/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this argument is passed when using Navigator.pushNamed
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getit<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
                
    }
  }
}
