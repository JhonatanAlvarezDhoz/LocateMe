import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/location/data/models/photo.dart';
import 'package:locate_me/modules/location/data/repository/photo_repository.dart';

class UcCreatePhotoParams {
  final Photo photo;

  UcCreatePhotoParams({required this.photo});
}

class UcCreatePhoto extends UseCase<bool, UcCreatePhotoParams> {
  final PhotoRepository photoRepository;

  UcCreatePhoto({required this.photoRepository});
  @override
  Future<bool> call({UcCreatePhotoParams? params}) async {
    try {
      final bool response = await photoRepository.createPhoto(params!.photo);

      switch (response) {
        case true:
          return true;
        case false:
          return false;
        default:
          throw UseCaseException(
              "Hubo un error al momento de crear una photo. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch CreatePhoto : ${e.toString()}");
      throw Exception();
    }
  }
}
