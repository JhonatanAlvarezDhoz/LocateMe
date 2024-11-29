import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';

class UcAddFriendParams {
  final Friend friend;

  UcAddFriendParams({required this.friend});
}

class UcAddFriend extends UseCase<bool, UcAddFriendParams> {
  final FrinedRepository userRepository;

  UcAddFriend({required this.userRepository});
  @override
  Future<bool> call({UcAddFriendParams? params}) async {
    try {
      final bool response = await userRepository.addFriend(params!.friend);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException("No pudo agregar un amigo. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de agregar un amigo. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch CreateUser : ${e.toString()}");
      throw Exception();
    }
  }
}
