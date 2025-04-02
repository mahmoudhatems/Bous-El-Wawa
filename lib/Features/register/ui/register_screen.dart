import 'package:bouselwawa/Features/register/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:bouselwawa/Features/register/widgets/sign_up_bloc_listener.dart';
import 'package:bouselwawa/Features/register/widgets/sign_up_form.dart';
import 'package:bouselwawa/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:bouselwawa/Features/login/widgets/app_logo_and_name.dart';
import 'package:bouselwawa/Features/login/widgets/scoial_login.dart';
import 'package:bouselwawa/core/helpers/extentions.dart';
import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:bouselwawa/core/widgets/app_text_button.dart';
import 'package:bouselwawa/core/widgets/or_horizontal_divider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                Text('Create Account', style: TextStyles.font20TealSemiBold),
                Text('We are here to help you!',
                    style: TextStyles.font14GrayMoreRegular),
                verticalSpace(20),
                Column(
                  children: [
                    const SignupForm(),
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
                        buttonText: "Create Account",
                        onPressed: () {
                          validateThenDoSignup(context);
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
                          'have an account? ',
                          style: TextStyles.font14LightGrayRegular,
                        ),
                        GestureDetector(
                          onTap: () {
                           context.pushReplacementNamed(Routes.login);
                          },
                          child: Text(
                            'Login',
                            style: TextStyles.font16BlueSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: ColorsManager.primaryColorTealDark),
                          ),
                        ),
                      ],
                    ),
                    const SignupBlocListener(),
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


  void validateThenDoSignup (BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
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

