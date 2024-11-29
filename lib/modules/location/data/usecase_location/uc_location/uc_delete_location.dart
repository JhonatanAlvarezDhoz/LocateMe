import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/location/data/repository/location_repository.dart';

class UcDeleteLocationParams {
  final int locationId;

  UcDeleteLocationParams({required this.locationId});
}

class UcDeleteLocation extends UseCase<bool, UcDeleteLocationParams> {
  final LocationRepository locationRepository;

  UcDeleteLocation({required this.locationRepository});

  @override
  Future<bool> call({UcDeleteLocationParams? params}) async {
    try {
      final response =
          await locationRepository.deleteLocation(params!.locationId);

      switch (response) {
        case true:
          return response;
        case false:
          log(response.toString());
          return throw Exception(
              "No pudo eliminar la ubicación. Intente mas tarde");
        default:
          throw "Hubo un error al momento de eliminar la ubicación. Por favor contactar con el administrador.";
      }
    } catch (e) {
      log("Catch DeleteLocation : ${e.toString()}");
      throw Exception();
    }
  }
}
