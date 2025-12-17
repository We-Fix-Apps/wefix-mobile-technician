import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../unit/app_color.dart';
import '../unit/app_text_style.dart';

class WidgetTextField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? Function(dynamic)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Color? fillColor;
  final int? maxLength;
  final int maxLines;
  final double? radius;
  final bool? readOnly;
  final EdgeInsetsGeometry? padding;
  final bool? haveBorder;
  final InputBorder? border;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  const WidgetTextField(
    this.hintText, {
    this.onChanged,
    this.readOnly,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
    this.maxLines = 1,
    this.textInputAction,
    this.maxLength,
    super.key,
    this.fillColor,
    this.haveBorder,
    this.padding,
    this.onTap,
    this.hintStyle,
    this.radius,
    this.textStyle,
    this.inputFormatters,
    this.errorText,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      onTap: onTap,
      validator: validator,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      textInputAction: textInputAction ?? TextInputAction.done,
      style: textStyle ?? AppTextStyle.style14,
      decoration: InputDecoration(
        errorText: errorText,
        counter: const SizedBox(),
        hintStyle: hintStyle ?? AppTextStyle.style12.copyWith(color: AppColor.grey),
        contentPadding: padding ?? const EdgeInsets.all(7.0),
        fillColor: fillColor ?? AppColor.white,
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border:
            border ??
            (haveBorder == false
                ? InputBorder.none
                : OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(radius ?? 7),
                )),
        focusedBorder:
            border ??
            OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: haveBorder == null ? Theme.of(context).colorScheme.primary : Colors.transparent),
              borderRadius: BorderRadius.circular(radius ?? 7),
            ),
        disabledBorder:
            border ??
            OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: haveBorder == null ? Theme.of(context).colorScheme.primary : Colors.transparent),
              borderRadius: BorderRadius.circular(radius ?? 7),
            ),
        enabledBorder:
            border ??
            OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: haveBorder == null ? Theme.of(context).colorScheme.primary : Colors.transparent),
              borderRadius: BorderRadius.circular(radius ?? 7),
            ),
      ),
    );
  }
}
