import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcGetUserByIdParams {
  final int userId;

  UcGetUserByIdParams({required this.userId});
}

class UcGetUserById extends UseCase<User, UcGetUserByIdParams> {
  final UserRepository userRepository;

  UcGetUserById({required this.userRepository});

  @override
  Future<User> call({UcGetUserByIdParams? params}) async {
    try {
      final User? response = await userRepository.getUsersById(params!.userId);

      if (response == null) {
        return throw Exception(response.toString());
      }
      return response;
    } catch (e) {
      log("Catch GetUserById : ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
