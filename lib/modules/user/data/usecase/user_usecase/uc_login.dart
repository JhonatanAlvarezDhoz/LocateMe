import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcLoginUserParams {
  final String email;
  final String password;

  UcLoginUserParams({required this.email, required this.password});
}

class UcLoginUser extends UseCase<List, UcLoginUserParams> {
  final UserRepository userRepository;

  UcLoginUser({required this.userRepository});
  @override
  Future<List> call({UcLoginUserParams? params}) async {
    try {
      final List response =
          await userRepository.login(params!.email, params.password);

      switch (response[0]) {
        case true:
          return response;
        case false:
          return response;
        default:
          throw UseCaseException(
              "Hubo un error al momento de crear el usuario. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch LoginUser : ${e.toString()}");
      throw Exception();
    }
  }
}
