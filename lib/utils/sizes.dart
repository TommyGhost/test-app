import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets pad({
  double both = 0,
  double? horiz,
  double? vert,
}) =>
    EdgeInsets.symmetric(
      horizontal: (horiz ?? both).w,
      vertical: (vert ?? both).h,
    );

EdgeInsets padOnly({
  double? top,
  double? left,
  double? right,
  double? down,
}) {
  return EdgeInsets.only(top: top?.h ?? 0, left: left?.w ?? 0, right: right?.w ?? 0, bottom: down?.h ?? 0);
}
