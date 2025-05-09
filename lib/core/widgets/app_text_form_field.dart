import 'package:bouselwawa/core/theming/colors.dart';
import 'package:bouselwawa/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {

  final EdgeInsetsGeometry?contentPadding;
  final InputBorder ?focusedBorder;
  final InputBorder ?enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool ?obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController ?  controller;
  final Function (String? ) validator;
  
  const AppTextFormField({super.key, this.contentPadding, this.focusedBorder, this.enabledBorder, this.hintStyle, this.inputTextStyle, this.obscureText, required this.hintText, this.suffixIcon, this.prefixIcon,  this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: controller,
      validator: (value){
        return validator(value);
      },
      obscureText: obscureText?? false,
      style: TextStyles.font14TealDark,
      cursorColor: ColorsManager.primaryColorTeal,
      decoration: InputDecoration(
        
        fillColor:ColorsManager.textFormFieldBackground,
       filled: true ,
        isDense: true,
        contentPadding:contentPadding?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        focusedBorder: focusedBorder?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.primaryColorTeal, width: 1.3.w),
        ),
      errorBorder: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.red, width: 1.3.w)
      )  ,
      focusedErrorBorder:OutlineInputBorder(
       borderSide: BorderSide(color: Colors.red, width: 1.3.w)
      )  ,
        enabledBorder: enabledBorder??  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.lightGray, width: 1.3.w),
          
        ),

        hintStyle:hintStyle?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        
      ),
    );
  }
}