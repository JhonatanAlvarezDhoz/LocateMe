import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:locate_me/theme/theme_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String name;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? iconRoute;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool isFilled;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? errorTextColor;
  final double? maxHeight;
  final double? maxWidth;
  final double borderWidth;
  final double fontSizeHint;
  final double fontSizeLabel;
  final int maxLines;
  final FontWeight fontWeightHint;
  final FontWeight labelWeight;
  final TextInputType? keyboardType;

  const CustomTextFormField(
      {super.key,
      required this.name,
      this.labelText,
      this.hintText,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.initialValue,
      this.isFilled = false,
      this.borderColor,
      this.enabledBorderColor,
      this.hintColor,
      this.errorTextColor,
      this.maxHeight,
      this.maxWidth,
      this.labelColor,
      this.borderWidth = 1,
      this.fontSizeHint = 14,
      this.fontSizeLabel = 18,
      this.fontWeightHint = FontWeight.w300,
      this.labelWeight = FontWeight.w500,
      required this.maxLines,
      this.iconRoute,
      this.keyboardType = TextInputType.text,
      required FormFieldValidator<String> validator});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      keyboardType: keyboardType,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // Cambia este modo según tu preferencia
      maxLines: maxLines,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: errorText ?? 'Este campo es obligatorio',
        ),
      ]),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? 50,
          maxWidth: maxWidth ?? 327,
        ),
        filled: isFilled,
        fillColor: isFilled ? ThemeColors.white : Colors.transparent,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: fontSizeLabel,
          fontWeight: labelWeight,
          color: labelColor ?? ThemeColors.secondary,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSizeHint,
          fontWeight: fontWeightHint,
          color: hintColor,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        prefixIcon: iconRoute != null
            ? Padding(
                padding: const EdgeInsets.all(11.0),
                child: SvgPicture.asset(
                  iconRoute!,
                  width: 4,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    ThemeColors.secondary.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth,
            color: enabledBorderColor ?? ThemeColors.whiteGray,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth,
            color: borderColor ?? ThemeColors.primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
