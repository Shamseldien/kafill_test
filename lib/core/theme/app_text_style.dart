import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafill/core/theme/colors.dart';
import 'package:kafill/core/theme/font_helper.dart';

class AppTextStyles {

  static TextStyle font14GrayMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontHelper.medium,
    color: AppColors.gray,
      fontFamily: "Montserrat"
  );


  static TextStyle font12GreyMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontHelper.medium,
    color: AppColors.gray,
    fontFamily: "Montserrat"
  );


  static TextStyle font16Grey800Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontHelper.medium,
    color: AppColors.gray800,
    fontFamily: "Montserrat"
  );

  static TextStyle font14WhiteBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontHelper.medium,
    color: AppColors.white,
    fontFamily: "Montserrat"
  );

  static TextStyle font14BlackBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontHelper.medium,
    color: AppColors.black,
    fontFamily: "Montserrat",

  );


  static TextStyle font18DarkBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontHelper.semiBold,
    fontFamily: "Montserrat",
    color: AppColors.black,
  );
  static TextStyle font13GreySemiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontHelper.semiBold,
    fontFamily: "Montserrat",
    color: AppColors.gray300,
  );
}