import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcChangeProfilePhotoParams {
  final int userId;
  final String pictureBase64;

  UcChangeProfilePhotoParams({
    required this.userId,
    required this.pictureBase64,
  });
}

class UcChangeProfilePhoto extends UseCase<bool, UcChangeProfilePhotoParams> {
  final UserRepository userRepository;

  UcChangeProfilePhoto({required this.userRepository});
  @override
  Future<bool> call({UcChangeProfilePhotoParams? params}) async {
    try {
      final bool response = await userRepository.changeUserPassword(
          params!.userId, params.pictureBase64);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException(
              "No pudo cambiar la foto de perfil. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de cambiar la foto de perfil. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch ChangeProfilePicture : ${e.toString()}");
      throw Exception();
    }
  }
}
