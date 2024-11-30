import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locate_me/base/widgets/custom_text.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/location/controller/location_mobx/location_store.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/modules/user/controller/session_mobx/session_store.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:locate_me/utils/utils.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  void _loadLocations() async {
    final locationStore = Provider.of<LocationStore>(context, listen: false);
    final sessionStore = Provider.of<SessionStore>(context, listen: false);
    sessionStore.getSesseion();

    await locationStore.getLocationByUserId(sessionStore.session!.id!);
  }

  @override
  Widget build(BuildContext context) {
    final locationStore = Provider.of<LocationStore>(context, listen: false);
    return Scaffold(
      body: SizedBox(
        height: Responsive.of(context).heightResponsive(100),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                textAlign: TextAlign.start,
                text: "Ubicaciones",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              Container(
                height: constraints.maxHeight * .1,
                color: Colors.red,
                child: const Row(
                  children: [
                    SizedBox(
                      height: 40,
                      // child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: 4,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         height: 40,
                      //         width: 120,
                      //         decoration: BoxDecoration(
                      //             border:
                      //                 Border.all(color: ThemeColors.secondary),
                      //             borderRadius: BorderRadius.circular(20)),
                      //       );
                      //     }),
                    )
                  ],
                ),
              ),
              Observer(
                builder: (BuildContext context) {
                  return SizedBox(
                    height: constraints.maxHeight * .85,
                    child: ListView.builder(
                        itemCount: locationStore.locationList.length,
                        itemBuilder: (context, index) {
                          List<Location> locationList =
                              locationStore.locationList;

                          final Location location = locationList[index];
                          return ListTile(
                            leading: const Icon(Icons.location_on),
                            title: CustomText(text: location.name),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.locationDetailsPage,
                                  arguments: location);
                            },
                          );
                        }),
                  );
                },
              )
            ],
          );
        }),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.createLocationPage);
        },
        icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: ThemeColors.secondary,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.add_location_alt_rounded,
              color: ThemeColors.white,
            )),
      ),
    );
  }
}
