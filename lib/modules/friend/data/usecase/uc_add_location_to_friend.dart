import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';

class UcAddLocationToFriendParams {
  final int friendId;
  final List<int> locations;

  UcAddLocationToFriendParams(
      {required this.friendId, required this.locations});
}

class UcAddLocationToFriend extends UseCase<bool, UcAddLocationToFriendParams> {
  final FrinedRepository frinedRepository;

  UcAddLocationToFriend({required this.frinedRepository});
  @override
  Future<bool> call({UcAddLocationToFriendParams? params}) async {
    try {
      final bool response = await frinedRepository.addLocationToFriend(
          params!.friendId, params.locations);

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
      log("Catch AddLocationToFiend : ${e.toString()}");
      throw Exception();
    }
  }
}
