import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/login/ui/widgets/email_field.dart';
import 'package:locate_me/modules/login/ui/widgets/password_field.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:locate_me/modules/user/controller/session_mobx/session_store.dart';
import 'package:locate_me/modules/user/data/models/session/session.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> loginFormKey =
        GlobalKey<FormBuilderState>();
    Responsive responsive = Responsive.of(context);

    final userStore = Provider.of<UserStore>(context, listen: false);
    final sessionStore = Provider.of<SessionStore>(context, listen: false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
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
                  CustomButton(
                    text: "Iniciar sesion",
                    onPressed: () {
                      if (loginFormKey.currentState?.saveAndValidate() ??
                          false) {
                        final formValues = loginFormKey.currentState?.value;

                        loginUser(userStore, formValues, context, sessionStore);
                      }
                    },
                  ),
                  CustomButton(
                    text: "Crear una cuenta",
                    color: ThemeColors.tertiary,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.registerPage),
                  ),
                  gapH84
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginUser(UserStore userStore, Map<String, dynamic>? formValues,
      BuildContext context, SessionStore sessionStore) {
    // Create a User object from form values

    final String email = formValues?['email'];
    final String password = formValues?['password'];

    // Call createUser method from UserStore
    userStore.loginUser(email, password).then((_) {
      if (userStore.isLogin) {
        final newSession = Session(userId: userStore.userId!, isSession: true);

        sessionStore.createSesseion(newSession);
        Navigator.of(context).pushNamed(AppRoutes.baseePage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar(
            message: userStore.errorMessage ?? 'Usuario o contraseña invalidos',
            color: ThemeColors.redColor.withOpacity(0.6),
          ),
        );
      }
    });
  }
}
