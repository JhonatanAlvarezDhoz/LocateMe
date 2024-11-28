import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/theme/theme_colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.name,
    this.isFilled = false,
    super.key,
    this.errorTextColor,
    this.labelText,
    this.hintText,
    this.maxHeight,
    this.maxWidth,
    this.fontSizeHint,
    this.fontSizeLabel,
    this.labelWeight,
    this.borderColor,
    this.validator,
  }) : super();

  final bool isFilled;
  final Color? errorTextColor;
  final String? name;
  final String? labelText;
  final String? hintText;
  final double? maxHeight;
  final double? maxWidth;
  final double? fontSizeHint;
  final double? fontSizeLabel;
  final FontWeight? labelWeight;
  final Color? borderColor;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return RoundedTextFormField(
      labelWeight: widget.labelWeight,
      maxHeight: widget.maxHeight ?? double.infinity,
      maxWidth: widget.maxWidth ?? double.infinity,
      isFilled: widget.isFilled,
      name: widget.name ?? 'password',
      keyboardType: TextInputType.text,
      labelText: widget.labelText ?? 'Contraseña',
      hintText: widget.hintText ?? 'Agrega tu contraseña',
      fontSizeHint: widget.fontSizeHint,
      fontSizeLabel: widget.fontSizeLabel,
      obscureText: isObscure,
      errorTextColor: widget.errorTextColor,
      borderColor: widget.borderColor ?? ThemeColors.ligthBorderColor,
      borderWidth: 1,
      prefixIcon: Icon(
        Icons.lock_rounded,
        color: ThemeColors.secondary.withOpacity(0.6),
      ),
      suffixIcon: IconButton(
        onPressed: () => setState(() => isObscure = !isObscure),
        icon: Icon(
          isObscure ? Icons.visibility : Icons.visibility_off,
        ),
        color: ThemeColors.tertiary.withOpacity(0.2),
      ),
      validator: widget.validator ??
          FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: "La contraseña es requerida",
            ),
          ]),
    );
  }
}
