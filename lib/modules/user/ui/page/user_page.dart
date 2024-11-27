import 'package:flutter/material.dart';
import 'package:locate_me/base/widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: "User Page",
        ),
      ),
    );
  }
}
