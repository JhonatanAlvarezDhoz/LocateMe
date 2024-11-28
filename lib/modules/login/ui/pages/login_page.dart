import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/login/ui/widgets/email_field.dart';
import 'package:locate_me/modules/login/ui/widgets/password_field.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              gapH64,
              const SafeArea(
                  child: Icon(
                Icons.local_activity,
                size: 80,
                color: ThemeColors.primary,
              )),
              SizedBox(
                width: responsive.width,
                height: responsive.heightResponsive(22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Inicia sesion",
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.secondary,
                    ),
                    CustomText(
                      text: "con tu cuenta",
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                    gapH32,
                    CustomText(
                      text:
                          "Un usuario, una contraseña, infinitas posibilidades.",
                      maxLines: 2,
                      fontSize: 17,
                      color: ThemeColors.whiteGray,
                    ),
                  ],
                ),
              ),
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
