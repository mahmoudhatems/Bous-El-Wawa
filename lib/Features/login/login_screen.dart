
import 'package:bouselwawa/Features/login/widgets/app_logo_and_name.dart';
import 'package:bouselwawa/core/helpers/strings.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Column(
            children: [
              const AppLogoAndName(),
              SizedBox(height: 30.h),
              Text('Hi, Welcome Back!', style: TextStyles.font20TealSemiBold),
              Text('Hope you\'re doing fine.', style: TextStyles.font14GrayRegular),
              


            ],
          ),
        ),
      ),
    );
}}

