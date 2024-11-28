import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/login/ui/widgets/widgets.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/responsive.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> loginFormKey =
        GlobalKey<FormBuilderState>();
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: Container(
        width: responsive.width,
        height: responsive.height,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: FormBuilder(
          key: loginFormKey,
          child: Column(
            children: [
              const SafeArea(
                  child: Icon(
                Icons.local_activity,
                size: 80,
                color: ThemeColors.primary,
              )),
              SizedBox(
                width: responsive.width,
                height: responsive.heightResponsive(8.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Registrarse",
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.secondary,
                    ),
                    gapH32,
                  ],
                ),
              ),
              CustomTextFormField(
                iconRoute: "assets/icons/user.svg",
                name: "firstName",
                labelText: "Nombre",
                hintText: "Ingrese su nombre",
                fontSizeLabel: 14,
                maxLines: 1,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "El email es requerido",
                  ),
                ]),
              ),
              gapH20,
              CustomTextFormField(
                iconRoute: "assets/icons/user.svg",
                name: "secondName",
                labelText: "Apellido",
                hintText: "Ingrese su apellido",
                fontSizeLabel: 14,
                maxLines: 1,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "El email es requerido",
                  ),
                ]),
              ),
              gapH20,
              CustomTextFormField(
                iconRoute: "assets/icons/phone.svg",
                name: "phoneNumber",
                labelText: "Telefono",
                hintText: "Ingrese su telefono",
                fontSizeLabel: 14,
                maxLines: 1,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "El email es requerido",
                  ),
                ]),
              ),
              gapH20,
              const EmailField(
                fontSizeLabel: 14,
              ),
              gapH20,
              const PasswordField(fontSizeLabel: 14),
              const Spacer(),
              CustomButton(text: "Inisiar sesion"),
              CustomButton(
                text: "Crear una cuenta",
                color: ThemeColors.tertiary,
              ),
              gapH84
            ],
          ),
        ),
      ),
    );
  }
}
