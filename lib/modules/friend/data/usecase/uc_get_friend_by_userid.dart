import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';

class UcGetFrienByUserIdParams {
  final int userId;

  UcGetFrienByUserIdParams({
    required this.userId,
  });
}

class UcGetFrienByUserId
    extends UseCase<List<Friend>, UcGetFrienByUserIdParams> {
  final FrinedRepository frinedRepository;

  UcGetFrienByUserId({required this.frinedRepository});
  @override
  Future<List<Friend>> call({UcGetFrienByUserIdParams? params}) async {
    try {
      final List<Friend> response = await frinedRepository.getFriendsByUserId(
        params!.userId,
      );

      switch (response.runtimeType == List<Friend>) {
        case true:
          return response;
        case false:
          throw UseCaseException(
              "No pudo obtener los amigos. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de obtener los amigos. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch UcGetFrienByUserId : ${e.toString()}");
      throw Exception();
    }
  }
}
