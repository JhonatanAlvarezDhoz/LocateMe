import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/modules/location/data/repository/location_repository.dart';

class UcCreateLocationParams {
  final Location location;

  UcCreateLocationParams({required this.location});
}

class UcCreateLocation extends UseCase<bool, UcCreateLocationParams> {
  final LocationRepository locationRepository;

  UcCreateLocation({required this.locationRepository});
  @override
  Future<bool> call({UcCreateLocationParams? params}) async {
    try {
      final bool response =
          await locationRepository.createLocation(params!.location);

      switch (response) {
        case true:
          return true;
        case false:
          return false;
        default:
          throw UseCaseException(
              "Hubo un error al momento de crear una location. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch CreateLocation : ${e.toString()}");
      throw Exception();
    }
  }
}
