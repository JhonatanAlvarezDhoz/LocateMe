import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locate_me/base/ui/page/base_page.dart';
import 'package:locate_me/base/ui/page/splash_page.dart';
import 'package:locate_me/modules/home/ui/page/home_page.dart';
import 'package:locate_me/modules/location/ui/page/location_page.dart';
import 'package:locate_me/modules/user/ui/page/user_page.dart';
import 'package:locate_me/routes/app_routes.dart';

class AppPages {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.baseePage:
        return CupertinoPageRoute(builder: (_) => const BasePage());
      case AppRoutes.splashPage:
        return CupertinoPageRoute(builder: (_) => const SplashPage());

      case AppRoutes.homePage:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case AppRoutes.locationPage:
        return CupertinoPageRoute(builder: (_) => const LocationPage());
      case AppRoutes.userPage:
        return CupertinoPageRoute(builder: (_) => const UserPage());

      default:
        return CupertinoPageRoute(builder: (_) => const Scaffold());
    }
  }
}
