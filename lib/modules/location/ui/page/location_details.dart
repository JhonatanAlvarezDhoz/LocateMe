import 'package:flutter/material.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/utils.dart';

class LocationDetailPage extends StatelessWidget {
  const LocationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final Location location =
        ModalRoute.of(context)!.settings.arguments as Location;
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomText(
          text: "Detalles de ubicación",
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        actions: const [
          SizedBox(
            width: 40,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: responsive.height,
        width: responsive.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Nombre:",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.darkGray,
                  ),
                  gapH12,
                  CustomText(
                    text: location.name,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  gapH20,
                  CustomText(
                    text: "Descripción:",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.darkGray,
                  ),
                  gapH12,
                  CustomText(
                    text: location.description,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  gapH20,
                  CustomText(
                    text: "Latitud:",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.darkGray,
                  ),
                  gapH12,
                  CustomText(
                    text: location.latitude.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  gapH20,
                  CustomText(
                    text: "Longitud:",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.darkGray,
                  ),
                  gapH12,
                  CustomText(
                    text: location.longitude.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  gapH8,
                  CustomButton(
                      text: "Agregar Foto",
                      color: ThemeColors.tertiary,
                      onPressed: () {}
                      // Navigator.of(context).pushNamed(AppRoutes.registerPage),
                      ),
                  gapH8,
                  CustomButton(
                      text: "Delete ubicación",
                      color: ThemeColors.tertiary,
                      onPressed: () {}
                      // Navigator.of(context).pushNamed(AppRoutes.registerPage),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
