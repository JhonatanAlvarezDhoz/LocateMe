import 'package:flutter/material.dart';

class IconNavBottomBar {
  String iconString;
  String? title;
  Color? color;

  IconNavBottomBar({required this.iconString, this.title, this.color});
}

List<IconNavBottomBar> iconNavBottomBar = [
  IconNavBottomBar(
    iconString: "assets/icons/house.svg",
    title: "Inicio",
  ),
  IconNavBottomBar(
    iconString: "assets/icons/ping.svg",
    title: "Lugares",
  ),
  IconNavBottomBar(
    iconString: "assets/icons/user.svg",
    title: "User",
  )
];
