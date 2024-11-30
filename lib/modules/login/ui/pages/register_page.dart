import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/login/ui/widgets/widgets.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/responsive.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> loginFormKey =
        GlobalKey<FormBuilderState>();
    Responsive responsive = Responsive.of(context);

    final userStore = Provider.of<UserStore>(context, listen: false);

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
                  ],
                ),
              ),
              gapH32,
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
                name: "lastName",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(text: "¿Ya tienes cuenta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.loginPage);
                      },
                      child: CustomText(
                        text: "Inisia sesion",
                        color: Colors.blue,
                      )),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: "Crear una cuenta",
                onPressed: () {
                  if (loginFormKey.currentState?.saveAndValidate() ?? false) {
                    final formValues = loginFormKey.currentState?.value;

                    createUser(userStore, formValues, context);
                  }
                },
              ),
              SizedBox(
                height: responsive.heightResponsive(7),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createUser(UserStore userStore, Map<String, dynamic>? formValues,
      BuildContext context) {
    // Create a User object from form values
    final newUser = User(
      firstName: formValues?['firstName'],
      lastName: formValues?['lastName'],
      email: formValues?['email'],
      phoneNumber: formValues?['phoneNumber'],
      password: formValues?['password'],
      friendId: [],
      locationId: [],
    );

    // Call createUser method from UserStore
    userStore.createUser(newUser).then((_) {
      if (userStore.isCreated) {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar(
            message: 'Usuario creado exitosamente',
            color: ThemeColors.greenColor.withOpacity(0.6),
          ),
        );
        Navigator.of(context).pushNamed(AppRoutes.loginPage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar(
            message: userStore.errorMessage ?? 'Error al crear usuario',
            color: ThemeColors.redColor.withOpacity(0.6),
          ),
        );
      }
    });
  }
}
