import 'package:bouselwawa/Features/onboarding/widgets/app_logo_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Padding(
        padding:  EdgeInsets.only(top: 30.h),
        child: Column(
          children: [
            AppLogoAndName(),
          ],
        ),
      )
      ),
    );
  }
}