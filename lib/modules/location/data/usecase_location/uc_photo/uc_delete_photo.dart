import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/location/data/repository/photo_repository.dart';

class UcDeletePhotoParams {
  final int photoId;

  UcDeletePhotoParams({required this.photoId});
}

class UcDeletePhoto extends UseCase<bool, UcDeletePhotoParams> {
  final PhotoRepository photoRepository;

  UcDeletePhoto({required this.photoRepository});

  @override
  Future<bool> call({UcDeletePhotoParams? params}) async {
    try {
      final response = await photoRepository.deletePhoto(params!.photoId);

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
      log("Catch DeletePhoto : ${e.toString()}");
      throw Exception();
    }
  }
}
