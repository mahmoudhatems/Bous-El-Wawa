import 'package:bouselwawa/Features/login/data/models/login_request.dart';
import 'package:bouselwawa/Features/login/logic/cubit/login_cubit.dart';
import 'package:bouselwawa/Features/login/widgets/app_logo_and_name.dart';
import 'package:bouselwawa/Features/login/widgets/email_and_password.dart';
import 'package:bouselwawa/Features/login/widgets/login_bloc_listener.dart';
import 'package:bouselwawa/Features/login/widgets/scoial_login.dart';
import 'package:bouselwawa/core/helpers/extentions.dart';
import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/helpers/strings.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:bouselwawa/core/widgets/app_text_button.dart';
import 'package:bouselwawa/core/widgets/or_horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                verticalSpace(20),
                Text('Hi, Welcome Back!', style: TextStyles.font20TealSemiBold),
                Text('Hope you\'re doing fine.',
                    style: TextStyles.font14GrayMoreRegular),
                verticalSpace(20),
                Column(
                  children: [
                    const EmailAndPasswordTextField(),
                    verticalSpace(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password? ',
                        style: TextStyles.font16BlueSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: ColorsManager.primaryColorTealDark),
                      ),
                    ),
                    verticalSpace(10),
                    AppTextButton(
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonText: "Login",
                        onPressed: () {
                          validateThenLogin(context);
                        }),
                    verticalSpace(20),
                    const OrHorizontalDivider(),
                    verticalSpace(20),
                    const SocialLogin(),
                    verticalSpace(10),
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
                            style: TextStyles.font16BlueSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: ColorsManager.primaryColorTealDark),
                          ),
                        ),
                      ],
                    ),
                    const LoginBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitloginState(LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ));
    } else {
      // Show error message if the form is not valid
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorsManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            icon: const Icon(
              Icons.error_outline,
              color: ColorsManager.red,
            ),
            content: Text('Please fill in all fields',
                style: TextStyles.font13TealSemiBold),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Got it',
                  style: TextStyle(color: ColorsManager.primaryColorTeal),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
