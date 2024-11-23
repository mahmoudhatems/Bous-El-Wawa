
import 'package:bouselwawa/Features/login/widgets/app_logo_and_name.dart';
import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/helpers/strings.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppLogoAndName(),
               verticalSpace(30),
                Text('Hi, Welcome Back!', style: TextStyles.font20TealSemiBold),
                Text('Hope you\'re doing fine.', style: TextStyles.font14GrayMoreRegular),
                verticalSpace(40),
                 Form(child: Column(
                  children: [
                    
                  ],
                 ))
            
            
              ],
            ),
          ),
        ),
      ),
    );
}}

