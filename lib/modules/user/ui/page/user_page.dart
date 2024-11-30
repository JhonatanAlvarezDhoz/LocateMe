import 'package:flutter/material.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/user/controller/session_mobx/session_store.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionStore = Provider.of<SessionStore>(context, listen: false);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 60,
          width: 200,
          child: CustomButton(
            text: "Cerrar session",
            color: ThemeColors.redColor,
            onPressed: () async {
              await sessionStore.deleteSesseion(sessionStore.session!.id!);
              toLogin(sessionStore, context);
            },
          ),
        ),
      ),
    );
  }

  void toLogin(SessionStore sessionStore, BuildContext context) {
    if (sessionStore.isSession == false) {
      Navigator.of(context).pushNamed(AppRoutes.loginPage);
    }
  }
}
