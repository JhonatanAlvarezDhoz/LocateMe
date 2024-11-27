import 'package:flutter/material.dart';
import 'package:locate_me/base/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: "Home Page",
        ),
      ),
    );
  }
}
