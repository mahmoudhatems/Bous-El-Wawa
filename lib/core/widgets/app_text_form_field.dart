import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.primaryColorTeal, width: 1.3.w),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.lightGray, width: 1.3.w),
        ),

        hintStyle: TextStyles.font14LightGrayRegular
      ),
    );
  }
}