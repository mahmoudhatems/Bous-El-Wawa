import 'package:bouselwawa/Features/login/logic/cubit/login_cubit.dart';
import 'package:bouselwawa/Features/login/widgets/password_validation.dart';
import 'package:bouselwawa/core/helpers/app_regex.dart';
import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/icons.dart';
import 'package:bouselwawa/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailAndPasswordTextField extends StatefulWidget {
  const EmailAndPasswordTextField({super.key});

  @override
  State<EmailAndPasswordTextField> createState() =>
      _EmailAndPasswordTextFieldState();
}

class _EmailAndPasswordTextFieldState extends State<EmailAndPasswordTextField> {
  bool isObscure = true;

  bool hasLowercas = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercas = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter your email';
              }
            },
            hintText: "Email",
            prefixIcon: AbsorbPointer(
              absorbing: true,
              child: IconButton(
                iconSize: 24.sp,
                onPressed: () {},
                icon: SvgPicture.asset(
                  IconsManager.mailIcon,
                ),
              ),
            ),
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
            },
            hintText: "Password",
            obscureText: isObscure,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 24.sp,
                  color: ColorsManager.lightTextGray,
                  applyTextScaling: true,
                )),
            prefixIcon: AbsorbPointer(
              absorbing: true,
              child: IconButton(
                onPressed: () {},
                iconSize: 24.sp,
                icon: SvgPicture.asset(
                  IconsManager.passwordIcon,
                ),
              ),
            ),
          ),
          verticalSpace(18),
          PasswordValidation(
            hasLowercase: hasLowercas,
            hasUppercase: hasUppercase,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.removeListener(() {});
    super.dispose();
  }
}
