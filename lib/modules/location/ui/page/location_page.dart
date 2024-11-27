import 'package:flutter/material.dart';
import 'package:locate_me/base/widgets/widgets.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: "Location Page",
        ),
      ),
    );
  }
}
