import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/responsive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      // in this point you can add functionality for init or validadte sesion
      Navigator.of(context).pushReplacementNamed(AppRoutes.baseePage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: ThemeColors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
          ),
          Center(
            child: ZoomIn(
                duration: const Duration(milliseconds: 4000),
                child: const Icon(
                  Icons.location_on,
                  color: ThemeColors.white,
                )
                // Image.asset(
                //   "assets/images/logotitle.png",
                //   width: 200,
                // ),
                ),
          ),
          Positioned(
              top: responsive.heightResponsive(90),
              left: responsive.widthResponsive(27),
              child: CustomText(text: "Ten el control de tu futuro"))
        ],
      ),
    );
  }
}
