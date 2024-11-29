import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';

class UcDeleteFriendParams {
  final int friendId;

  UcDeleteFriendParams({required this.friendId});
}

class UcDeleteFriend extends UseCase<bool, UcDeleteFriendParams> {
  final FrinedRepository frinedRepository;

  UcDeleteFriend({required this.frinedRepository});

  @override
  Future<bool> call({UcDeleteFriendParams? params}) async {
    try {
      final response = await frinedRepository.deleteFriend(params!.friendId);

      switch (response) {
        case true:
          return response;
        case false:
          log(response.toString());
          return throw Exception(
              "No pudo eliminar el amigo. Intente mas tarde");
        default:
          throw "Hubo un error al momento de eliminar el amigo. Por favor contactar con el administrador.";
      }
    } catch (e) {
      log("Catch DeleteFriend : ${e.toString()}");
      throw Exception();
    }
  }
}
