import 'package:bouselwawa/Features/home/ui/home_Screen.dart';
import 'package:bouselwawa/Features/login/login_screen.dart';
import 'package:bouselwawa/Features/onboarding/onboarding_screen.dart';
import 'package:bouselwawa/Features/register/ui/register_screen.dart';
import 'package:bouselwawa/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}