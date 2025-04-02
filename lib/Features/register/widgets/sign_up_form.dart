import 'package:bouselwawa/Features/login/widgets/password_validation.dart';
import 'package:bouselwawa/Features/register/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:bouselwawa/core/helpers/app_regex.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            prefixIcon:AbsorbPointer(
              absorbing: true,
              child: IconButton(
                onPressed: () {},
                iconSize: 24.sp,
                icon: SvgPicture.asset(
                  IconsManager.userIcon,
                ),
              ),
            ), 
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
             prefixIcon:AbsorbPointer(
              absorbing: true,
              child: IconButton(
                onPressed: () {},
                iconSize: 24.sp,
                icon:Icon(
                  Icons.phone_outlined,
                  color: ColorsManager.lightTextGray,
                  size: 20.sp,
                ),
              ),
            ), 
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
              prefixIcon:AbsorbPointer(
                absorbing: true,
                child: IconButton(
                  onPressed: () {},
                  iconSize: 24.sp,
                  icon: SvgPicture.asset(
                    IconsManager.mailIcon,
                  ),
                ),
              ),
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            prefixIcon:AbsorbPointer(
              absorbing: true,
              child: IconButton(
                onPressed: () {},
                iconSize: 24.sp,
                icon: SvgPicture.asset(
                  IconsManager.passwordIcon,
                ),
              ),
            ),
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            obscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child:  Icon(
                  isPasswordObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 24.sp,
                  color: ColorsManager.lightTextGray,
                  applyTextScaling: true,
                )
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            prefixIcon:AbsorbPointer(
              absorbing: true,
              child: IconButton(
                onPressed: () {},
                iconSize: 24.sp,
                icon: SvgPicture.asset(
                  IconsManager.passwordIcon,
                ),
              ),
            ),
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            obscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                  isPasswordObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 24.sp,
                  color: ColorsManager.lightTextGray,
                  applyTextScaling: true,
                )
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidation(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}