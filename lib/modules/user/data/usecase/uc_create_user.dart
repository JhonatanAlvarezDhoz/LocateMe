import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcCreateUserParams {
  final User user;

  UcCreateUserParams({required this.user});
}

class UcCreateUser extends UseCase<bool, UcCreateUserParams> {
  final UserRepository userRepository;

  UcCreateUser({required this.userRepository});
  @override
  Future<bool> call({UcCreateUserParams? params}) async {
    try {
      final bool response = await userRepository.createUser(params!.user);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException("No pudo crear el usuario. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de crear el usuario. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch CreateUser : ${e.toString()}");
      throw Exception();
    }
  }
}
