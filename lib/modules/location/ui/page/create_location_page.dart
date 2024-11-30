import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geolocator/geolocator.dart';

import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/location/controller/location_mobx/location_store.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/services/location_service.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/utils.dart';
import 'package:provider/provider.dart';

class CreateLocationPage extends StatefulWidget {
  const CreateLocationPage({super.key});

  @override
  State<CreateLocationPage> createState() => _CreateLocationPageState();
}

class _CreateLocationPageState extends State<CreateLocationPage> {
  Position? _position;
  LocationService? locationService;

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
    getPosition();
  }

  void getPosition() async {
    if (locationService != null) {
      _position = await locationService!.getCurrentLocation();
      log(_position.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final GlobalKey<FormBuilderState> createLocationFormKey =
        GlobalKey<FormBuilderState>();

    final locationStore = Provider.of<LocationStore>(context, listen: false);

    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            alignment: Alignment.centerLeft,
            height: responsive.height,
            width: responsive.width,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Spacer(),
                CustomText(
                  text: "Crear Ubicación",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                gapH24,
                FormBuilder(
                  key: createLocationFormKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        name: "name",
                        labelText: "Nombre",
                        hintText: "Nombre de la ubicacion",
                        maxLines: 1,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "El nombre es requerido",
                          ),
                        ]),
                      ),
                      gapH24,
                      CustomTextFormField(
                        name: "description",
                        labelText: "Descrpción",
                        hintText: "Descrpción de la ubicacion",
                        maxLines: 1,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "La descrpción es requerido",
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                gapH24,
                CustomButton(
                  text: "Crear",
                  onPressed: () {
                    getPosition();
                    if (createLocationFormKey.currentState?.saveAndValidate() ??
                        false) {
                      final formValues =
                          createLocationFormKey.currentState?.value;

                      createLocation(locationStore, formValues, context);
                    }
                  },
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }

  void createLocation(LocationStore locationStore,
      Map<String, dynamic>? formValues, BuildContext context) {
    // Create a User object from form values
    if (_position != null) {
      final newLocation = Location(
        name: formValues?['name'],
        description: formValues?['description'],
        latitude: _position!.latitude,
        longitude: _position!.longitude,
        userId: 1,
      );

      log(newLocation.toString());
      // Call createUser method from UserStore
      locationStore.createLocation(newLocation).then((_) {
        if (locationStore.isCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message: 'Usuario creado exitosamente',
              color: ThemeColors.greenColor.withOpacity(0.6),
            ),
          );

          Navigator.of(context).pushNamed(AppRoutes.baseePage);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message: locationStore.errorMessage ?? 'Error al crear ubicación',
              color: ThemeColors.redColor.withOpacity(0.6),
            ),
          );
        }
      });
    }
  }
}
