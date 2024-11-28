// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/theme/theme_colors.dart';

class RoundedTextFormField extends FormBuilderTextField {
  final String? labelText;
  final String? errorText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isFilled;
  final Color? errorTextColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? enabledFillColor;
  final Color? hintColor;
  final Color? labelColor;
  final double? maxHeight;
  final double? maxWidth;
  final double? borderWidth;
  final double? fontSizeLabel;
  final double? fontSizeHint;
  final FontWeight? fontWeightHint;
  final FontWeight? labelWeight;
  @override
  final String? initialValue;
  @override
  final bool readOnly;

  RoundedTextFormField({
    super.controller,
    super.keyboardType,
    super.minLines,
    super.maxLines,
    this.errorText,
    required super.name,
    this.labelText,
    this.hintText,
    super.validator,
    super.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isFilled = false,
    this.errorTextColor,
    this.borderColor,
    this.enabledFillColor,
    this.enabledBorderColor,
    this.initialValue,
    this.readOnly = false,
    this.maxHeight,
    this.maxWidth,
    this.labelWeight,
    this.borderWidth,
    this.fontSizeHint,
    this.fontSizeLabel,
    this.fontWeightHint,
    this.hintColor,
    this.labelColor,
    super.textAlign,
    super.onTap,
    super.key,
  }) : super(
            initialValue: initialValue,
            readOnly: readOnly,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                  maxHeight: maxHeight ?? double.infinity,
                  maxWidth: maxWidth ?? double.infinity),
              filled: isFilled,
              fillColor: isFilled
                  ? enabledFillColor ?? ThemeColors.white
                  : Colors.transparent,
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(
                  fontSize: fontSizeLabel ?? 18,
                  color: labelColor ?? ThemeColors.secondary,
                  fontWeight: labelWeight ?? FontWeight.w500),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                fontSize: fontSizeHint ?? 14,
                fontWeight: fontWeightHint,
                color: hintColor ?? ThemeColors.whiteGray,
              ),
              errorMaxLines: 3,
              errorStyle: TextStyle(
                color: errorTextColor,
                overflow: TextOverflow.clip,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              focusedBorder: isFilled
                  ? NoneOutlineInputBorder()
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: enabledBorderColor ?? ThemeColors.whiteGray,
                      ),
                    ),
              enabledBorder: isFilled
                  ? (enabledBorderColor != null
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            width: borderWidth ?? 1,
                            color: enabledBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )
                      : NoneOutlineInputBorder())
                  : (OutlineInputBorder(
                      borderSide: BorderSide(
                        width: borderWidth ?? 1.8,
                        color: borderColor ??
                            ThemeColors.tertiary.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )),
              border: isFilled
                  ? NoneOutlineInputBorder()
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
            ));
}
