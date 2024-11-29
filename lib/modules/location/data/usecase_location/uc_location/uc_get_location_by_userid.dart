import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/modules/location/data/repository/location_repository.dart';

class UcGetLocationByUserIdParams {
  final int userId;

  UcGetLocationByUserIdParams({
    required this.userId,
  });
}

class UcGetLocationByUserId
    extends UseCase<List<Location>, UcGetLocationByUserIdParams> {
  final LocationRepository locationRepository;

  UcGetLocationByUserId({required this.locationRepository});
  @override
  Future<List<Location>> call({UcGetLocationByUserIdParams? params}) async {
    try {
      final List<Location> response =
          await locationRepository.getLocationsByUserId(
        params!.userId,
      );

      switch (response.runtimeType == List<Friend>) {
        case true:
          return response;
        case false:
          throw UseCaseException(
              "No pudo obtener las ubicaciones. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de obtener las ubicaciones. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch UcGetLocationByUserId : ${e.toString()}");
      throw Exception();
    }
  }
}
