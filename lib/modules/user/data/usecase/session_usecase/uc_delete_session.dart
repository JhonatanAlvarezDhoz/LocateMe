import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/respository/session_repository.dart';

class UcDeleteSessionParams {
  final int sessionId;

  UcDeleteSessionParams({required this.sessionId});
}

class UcDeleteSession extends UseCase<bool, UcDeleteSessionParams> {
  final SessionRepository sessionRepository;

  UcDeleteSession({required this.sessionRepository});

  @override
  Future<bool> call({UcDeleteSessionParams? params}) async {
    try {
      final response = await sessionRepository.deleteSession(params!.sessionId);

      switch (response) {
        case true:
          return response;
        case false:
          log(response.toString());
          return throw Exception(
              "No pudo eliminar la session. Intente mas tarde");
        default:
          throw "Hubo un error al momento de eliminar la session. Por favor contactar con el administrador.";
      }
    } catch (e) {
      log("Catch DeleteUser : ${e.toString()}");
      throw Exception();
    }
  }
}
