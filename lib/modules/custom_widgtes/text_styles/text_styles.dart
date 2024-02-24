import 'package:flutter/material.dart';
import 'package:hadith_app/utils/constants/app_colors.dart';
import 'package:hadith_app/utils/constants/app_fonts.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class TextStyles {

  static TextStyle largeStyle ({Color? color, TextOverflow? overflow, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    color: color ?? AppColors.baseFontColor,
    fontFamily: AppFonts.mulishRegular,
    overflow: overflow ?? TextOverflow.visible,

    fontSize: fontSize ?? Dimensions.fontSize15,
    fontWeight: fontWeight ?? FontWeight.normal,
  );

  static TextStyle mediumStyle ({Color? color, TextOverflow? overflow, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    color: color ?? AppColors.baseFontColor,
    fontFamily: AppFonts.mulishRegular,
    overflow: overflow ?? TextOverflow.visible,
    fontSize: fontSize ?? Dimensions.fontSize13,
    fontWeight: fontWeight ?? FontWeight.w600,
  );

  static TextStyle smallStyle ({Color? color, TextOverflow? overflow, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    color: color ?? AppColors.baseFontColor,
    fontFamily: AppFonts.mulishRegular,
    overflow: overflow ?? TextOverflow.visible,
    fontSize: fontSize ?? Dimensions.fontSize11,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}