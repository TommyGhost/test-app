import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color? color, double? height) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      height: height);
}


TextStyle getRegularStyle(
    {double fontSize = FontSize.s14, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.regular, color, height);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.medium, color, height);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.semiBold, color, height);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.bold, color, height);
}


