import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/location/data/models/photo.dart';
import 'package:locate_me/modules/location/data/repository/photo_repository.dart';

class UcGetPhotoByLocationIdParams {
  final int locationId;

  UcGetPhotoByLocationIdParams({
    required this.locationId,
  });
}

class UcGetPhotoByLocationId
    extends UseCase<List<Photo>, UcGetPhotoByLocationIdParams> {
  final PhotoRepository photoRepository;

  UcGetPhotoByLocationId({required this.photoRepository});
  @override
  Future<List<Photo>> call({UcGetPhotoByLocationIdParams? params}) async {
    try {
      final List<Photo> response = await photoRepository.getPhotoByLocationId(
        params!.locationId,
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
      log("Catch UcGetPhotoByLocationId : ${e.toString()}");
      throw Exception();
    }
  }
}
