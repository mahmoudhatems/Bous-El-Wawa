import 'package:bouselwawa/Features/login/widgets/app_logo_and_name.dart';
import 'package:bouselwawa/Features/login/widgets/email_and_password.dart';
import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/helpers/strings.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:bouselwawa/core/widgets/app_text_button.dart';
import 'package:bouselwawa/core/widgets/app_text_form_field.dart';
import 'package:bouselwawa/core/widgets/or_horizontal_divider.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                const AppLogoAndName(),
                verticalSpace(30),
                Text('Hi, Welcome Back!', style: TextStyles.font20TealSemiBold),
                Text('Hope you\'re doing fine.',
                    style: TextStyles.font14GrayMoreRegular),
                verticalSpace(40),
                Column(
                  children: [

                    const EmailAndPasswordTextField(),
                    verticalSpace(20),
                   
                    verticalSpace(18),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password? ',
                        style: TextStyles.font13TealSemiBold,
                      ),
                    ),
                    verticalSpace(20),
                    AppTextButton(
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonText: "Login",
                        onPressed: () {}),
                    verticalSpace(30),
                    const OrHorizontalDivider(),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor:
                              ColorsManager.textFormFieldBackground,
                          child: SvgPicture.asset(
                            Strings.googleIcon,
                            width: 30.w,
                          ),
                        ),
                        horizontalSpace(40),
                        CircleAvatar(
                
                          backgroundColor:
                              ColorsManager.textFormFieldBackground,
                          radius: 30.r,
                          child: SvgPicture.asset(
                            Strings.facebookIcon,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyles.font14LightGrayRegular,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyles.font16TealSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
