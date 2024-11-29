import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/models/session/session.dart';
import 'package:locate_me/modules/user/data/respository/session_repository.dart';

class UcCreateSessionParams {
  final Session session;

  UcCreateSessionParams({required this.session});
}

class UcCreateSession extends UseCase<bool, UcCreateSessionParams> {
  final SessionRepository sessionRepository;

  UcCreateSession({required this.sessionRepository});
  @override
  Future<bool> call({UcCreateSessionParams? params}) async {
    try {
      final bool response =
          await sessionRepository.createSessionr(params!.session);

      switch (response) {
        case true:
          return true;
        case false:
          throw UseCaseException(
              "No pudo guardar la session. Intente mas tarde");
        default:
          throw UseCaseException(
              "Hubo un error al momento de crear el usuario. Por favor contactar con el administrador.");
      }
    } catch (e) {
      log("Catch Createssession : ${e.toString()}");
      throw Exception();
    }
  }
}
