import 'package:bouselwawa/core/helpers/spacing.dart';
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation(
      {super.key,
      required this.hasLowercase,
      required this.hasUppercase,
      required this.hasNumber,
      required this.hasSpecialCharacters,
      required this.hasMinLength});

  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasSpecialCharacters;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          hasLowercase,
          'At least one lowercase letter',
        ),
        buildValidationRow(
          hasUppercase,
          'At least one uppercase letter',
        ),
        buildValidationRow(
          hasNumber,
          'At least one number',
        ),
        buildValidationRow(
          hasSpecialCharacters,
          'At least one special character',
        ),
        buildValidationRow(
          hasMinLength,
          'At least 8 characters',
        ),
      ],
    );
  }

  buildValidationRow(bool hasValidated, String text) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: ColorsManager.lightGray,
        ),
        horizontalSpace(6),
        Text(text,
            style: TextStyles.font14TealDark.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: ColorsManager.primaryColorTeal,
              decorationThickness: 2.0,
              color: hasValidated
                  ? ColorsManager.lightGray
                  : ColorsManager.primaryColorTeal,
            )),
      ],
    );
  }
}
