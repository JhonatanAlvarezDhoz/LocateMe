import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcChangePasswordParams {
  final int userId;
  final String password;

  UcChangePasswordParams({
    required this.userId,
    required this.password,
  });
}

class UcChangePassword extends UseCase<bool, UcChangePasswordParams> {
  final UserRepository userRepository;

  UcChangePassword({required this.userRepository});
  @override
  Future<bool> call({UcChangePasswordParams? params}) async {
    try {
      final bool response = await userRepository.changeUserPassword(
          params!.userId, params.password);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException(
              "No pudo cambiar la coontraseña. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de cambiar la coontraseña. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch UcChangePassword : ${e.toString()}");
      throw Exception();
    }
  }
}
