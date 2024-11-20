
import 'package:bouselwawa/core/theming/colors.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static  TextStyle font32TealBold = TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold ,color: ColorsManager.primaryColorTeal);
  static  TextStyle font32TealRegular = TextStyle(fontSize: 32.sp, color: ColorsManager.primaryColorTeal);
  static  TextStyle font14GrayRegular = TextStyle(fontSize: 14.sp, color: ColorsManager.textGray, fontWeight: FontWeight.normal);
   static  TextStyle font20GrayBold = TextStyle(fontSize: 18.sp, color: ColorsManager.textGray, fontWeight: FontWeight.bold);
   static  TextStyle font18GrayRegular = TextStyle(fontSize: 18.sp, color: ColorsManager.textGray, fontWeight: FontWeight.normal);
   static  TextStyle font16WhiteSemiBold = TextStyle(fontSize: 16.sp, color: ColorsManager.white, fontWeight: FontWeight.w500);
   static  TextStyle font20TealSemiBold = TextStyle(fontSize:20.sp, color:ColorsManager.primaryColorTeal, fontWeight: FontWeight.w500);
}