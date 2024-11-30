import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/location/controller/location_mobx/location_store.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/utils.dart';
import 'package:provider/provider.dart';

class LocationDetailPage extends StatefulWidget {
  const LocationDetailPage({super.key});

  @override
  State<LocationDetailPage> createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  final List<XFile?> _images = [null];

  int get maxImageSelectors => 3;
  void _addOrRemoveImage(XFile? image, int index) {
    setState(() {
      if (index == _images.length - 1 && _images.length < maxImageSelectors) {
        _images.add(null);
        _images.insert(0, image);
      }
      _images[index] = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final Location location =
        ModalRoute.of(context)!.settings.arguments as Location;
    final locationStore = Provider.of<LocationStore>(context, listen: false);

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
                  Observer(
                    builder: (BuildContext context) {
                      return CustomButton(
                          text: locationStore.showPickImage
                              ? "Ocultar"
                              : "Agregar Foto",
                          color: ThemeColors.tertiary,
                          onPressed: () async {
                            await locationStore.showPickImageButtom();
                          });
                    },
                  ),
                  gapH8,
                  Observer(
                    builder: (context) {
                      return locationStore.showPickImage
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(1, (index) {
                                  return FormBuilderField<XFile>(
                                      name: 'image_file',
                                      initialValue: _images[0],
                                      builder: (FormFieldState<XFile?> field) {
                                        return RectangleImagePicker(
                                          image: _images[0],
                                          onImagePicked: (image) {
                                            _addOrRemoveImage(image, index);
                                            field.didChange(image);
                                          },
                                        );
                                      });
                                }),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
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
