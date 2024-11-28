import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/theme/theme_colors.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    this.isFilled = false,
    this.prefixIcon,
    this.errorTextColor,
    this.initialValue,
    super.key,
    this.labelText,
    this.hintText,
    this.maxHeight,
    this.maxWidth,
    this.fontSizeHint,
    this.fontSizeLabel,
  }) : super();

  final bool isFilled;
  final Widget? prefixIcon;
  final Color? errorTextColor;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final double? maxHeight;
  final double? maxWidth;
  final double? fontSizeHint;
  final double? fontSizeLabel;

  @override
  Widget build(BuildContext context) {
    return RoundedTextFormField(
      maxHeight: maxHeight ?? double.infinity,
      maxWidth: maxWidth ?? double.infinity,
      isFilled: isFilled,
      name: 'email',
      keyboardType: TextInputType.emailAddress,
      labelText: 'Correo electrónico',
      hintText: 'Ingresa tu correo',
      fontSizeHint: fontSizeHint,
      fontSizeLabel: fontSizeLabel,
      errorTextColor: errorTextColor,
      borderColor: ThemeColors.ligthBorderColor,
      borderWidth: 1,
      initialValue: initialValue,
      prefixIcon: isFilled
          ? null
          : Icon(
              Icons.email_outlined,
              color: ThemeColors.secondary.withOpacity(0.6),
            ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: "El email es requerido",
        ),
        FormBuilderValidators.email(
          errorText: "Correo electrónico Inválido",
        ),
        FormBuilderValidators.match(
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
          errorText: "Email no válido",
        ),
      ]),
    );
  }
}
