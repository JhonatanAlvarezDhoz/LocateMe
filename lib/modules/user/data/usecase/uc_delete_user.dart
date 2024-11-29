import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcDeleteUserParams {
  final int userId;

  UcDeleteUserParams({required this.userId});
}

class UcDeleteUser extends UseCase<bool, UcDeleteUserParams> {
  final UserRepository userRepository;

  UcDeleteUser({required this.userRepository});

  @override
  Future<bool> call({UcDeleteUserParams? params}) async {
    try {
      final response = await userRepository.deleteUser(params!.userId);

      switch (response) {
        case true:
          return response;
        case false:
          log(response.toString());
          return throw Exception(
              "No pudo eliminar el usuario. Intente mas tarde");
        default:
          throw "Hubo un error al momento de eliminar el usuario. Por favor contactar con el administrador.";
      }
    } catch (e) {
      log("Catch DeleteUser : ${e.toString()}");
      throw Exception();
    }
  }
}
