import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { fill, outline, text }

class Button extends StatelessWidget {
  final double? fontSize;
  final double? fontHeight;
  final double? height;
  final String title;
  final Border? border;
  final Function onPressed;
  final Color buttonBgColor;
  final Color buttonBorderColor;
  final Color? loadingColor;
  final Color? buttonTextColor;
  final bool? disabled;
  final ButtonType? buttonType;
  final EdgeInsets? padding;
  final bool? loading;
  const Button({
    Key? key,
    this.border,
    this.fontSize,
    this.fontHeight,
    this.height,
    required this.onPressed,
    this.buttonBgColor = Pallet.black,
    this.buttonBorderColor = Pallet.black,
    this.buttonTextColor = Pallet.black,
    required this.title,
    this.loadingColor,
    this.disabled,
    this.padding,
    this.loading,
    this.buttonType = ButtonType.fill,
  }) : super(key: key);

  Color getBackgroundColor() {
    if (buttonType == ButtonType.outline) {
      return Colors.transparent;
    } else if (buttonType == ButtonType.fill) {
      return buttonBgColor;
    } else {
      return Colors.transparent;
    }
  }

  Color getColor() {
    if (buttonType == ButtonType.fill) {
      return buttonTextColor != null ? buttonTextColor! : Pallet.white;
    } else if (buttonType == ButtonType.outline) {
      return buttonTextColor!;
    } else {
      return buttonTextColor != null ? buttonTextColor! : buttonBgColor;
    }
  }

  Border constructBorder() {
    if (border != null) {
      return border!;
    }
    if (buttonType == ButtonType.outline) {
      return Border.all(
        color: buttonBorderColor,
        width: 1.0.w,
      );
    } else {
      return Border.all(
        color: Colors.transparent,
        width: 0.w,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _color = getColor();
    final _bgColor = getBackgroundColor();
    return InkWell(
      // onTap: onPressed,
      onTap: ((disabled != null && disabled!) || loading != null && loading!)
          ? null
          : () => onPressed(),
      child: Container(
        height: height ?? 43.h,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color:
              (disabled != null && disabled!) || (loading != null && loading!)
                  ? _bgColor.withOpacity(0.6)
                  : _bgColor,
          border: constructBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loading != null && loading!
                ? const Text('')
                : Text(
                    title,
                    style: getBoldStyle(
                      color: _color,
                      fontSize: fontSize ?? FontSize.s16,
                      height: fontHeight ?? 18.77.toFigmaHeight(16),
                    ),
                  ),
            if (loading != null && loading!)
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: CircularProgressIndicator(
                  color: loadingColor ?? _color,
                  strokeWidth: 3,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
