import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcAddFriendToUserParams {
  final int userId;
  final List<int> friendIds;

  UcAddFriendToUserParams({
    required this.userId,
    required this.friendIds,
  });
}

class UcAddFriendToUser extends UseCase<bool, UcAddFriendToUserParams> {
  final UserRepository userRepository;

  UcAddFriendToUser({required this.userRepository});
  @override
  Future<bool> call({UcAddFriendToUserParams? params}) async {
    try {
      final bool response = await userRepository.addFriendToUser(
          params!.userId, params.friendIds);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException("No pudo agrgar el amigo. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de agrgar el amigo. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch UcAddFriendToUser : ${e.toString()}");
      throw Exception();
    }
  }
}
