import 'package:consultations_project/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? val)? onSaved;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final FocusNode? focusnode;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final double? fontHeight;
  final bool? enabled;
  final bool autofocus;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final String? initialValue;
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    this.autovalidateMode,
    this.textCapitalization,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.onSaved,
    this.hintText,
    this.formError,
    this.focusnode,
    this.textInputAction,
    this.controller,
    this.height,
    this.fontHeight,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.autofocus = false,
    this.border,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.validator,
    this.hintColor,
    this.autofillHints,
    this.showCursor,
    this.readOnly = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      style: getRegularStyle(
        fontSize: FontSize.s14,
        height: 16.8.toFigmaHeight(14),
        color: Pallet.primary,
      ),
      initialValue: initialValue,
      showCursor: showCursor,
      cursorColor: Pallet.primary,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      maxLength: maxLength,
      enabled: enabled,
      onTap: onTap,
      minLines: minLines,
      maxLines: maxLines,
      autovalidateMode: autovalidateMode,
      focusNode: focusnode,
      onSaved: onSaved,
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        counterText: '',
        border: border,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Pallet.actionsGrey),
              borderRadius: BorderRadius.circular(10.r),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Pallet.actionsGrey),
              borderRadius: BorderRadius.circular(10.r),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.r),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.r),
            ),
        isDense: true,
        hintText: hintText,
        hintStyle: getRegularStyle(
            fontSize: FontSize.s14,
            height: fontHeight ?? 16.8.toFigmaHeight(14),
            color: Pallet.actionsGrey),
        errorText: formError,
        errorMaxLines: 3,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: height == null ? 15.h : height!, horizontal: 15.w),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 32,
          maxHeight: 32,
        ),
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.white,
        filled: true,
      ),
      textAlign: textAlign ?? TextAlign.start,
      inputFormatters: inputFormatters,
      keyboardType: keyBoardType,
      onChanged: onChanged,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      onEditingComplete: onEdittingComplete,
      obscureText: obscureText ?? false,
    );
  }
}
