import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcUpdateUserParams {
  final int userId;
  final User user;

  UcUpdateUserParams({
    required this.userId,
    required this.user,
  });
}

class UcUpdateUser extends UseCase<bool, UcUpdateUserParams> {
  final UserRepository userRepository;

  UcUpdateUser({required this.userRepository});
  @override
  Future<bool> call({UcUpdateUserParams? params}) async {
    try {
      final bool response =
          await userRepository.updateUser(params!.userId, params.user);

      switch (response) {
        case true:
          return true;
        case false:
          return false;
        default:
          throw UseCaseException(
              "Hubo un error al momento de editar el usuario. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch EditUser : ${e.toString()}");
      throw Exception();
    }
  }
}
