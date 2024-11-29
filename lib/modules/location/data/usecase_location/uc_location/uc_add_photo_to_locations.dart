import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/location/data/repository/location_repository.dart';

class UcAddPhotoToLocationParams {
  final int locationId;
  final List<int> photoIds;

  UcAddPhotoToLocationParams(
      {required this.locationId, required this.photoIds});
}

class UcAddPhotoToLocation extends UseCase<bool, UcAddPhotoToLocationParams> {
  final LocationRepository locationRepository;

  UcAddPhotoToLocation({required this.locationRepository});
  @override
  Future<bool> call({UcAddPhotoToLocationParams? params}) async {
    try {
      final bool response = await locationRepository.addPhotoToLocation(
          params!.locationId, params.photoIds);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException("No pudo agregar una foto. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de agregar una foto. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch UcAddPhotoToLocation : ${e.toString()}");
      throw Exception();
    }
  }
}
