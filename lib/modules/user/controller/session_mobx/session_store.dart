import 'dart:developer';

import 'package:locate_me/modules/user/data/models/session/session.dart';
import 'package:mobx/mobx.dart';
import 'package:locate_me/modules/user/data/usecase/use_case.dart';

part 'session_store.g.dart';

class SessionStore = SessionStoreBase with _$SessionStore;

abstract class SessionStoreBase with Store {
  final UcCreateSession ucCreateSession;
  final UcGetSessionsNoParams ucGetSessionsNoParams;
  final UcDeleteSession ucDeleteSession;

  SessionStoreBase(
      {required this.ucCreateSession,
      required this.ucGetSessionsNoParams,
      required this.ucDeleteSession});

  @observable
  bool isSession = false;
  @observable
  bool isCreated = false;
  @observable
  bool isDelete = false;
  @observable
  Session? session;

  @action
  Future<void> createSesseion(Session session) async {
    try {
      final result = await ucCreateSession.call(
          params: UcCreateSessionParams(session: session));
      isCreated = result;
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future<void> getSesseion() async {
    try {
      final Session? result = await ucGetSessionsNoParams.call();

      if (result != null) {
        session = result;
        isSession = result.isSession;
      } else {
        session = null;
        isSession = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future<void> deleteSesseion(int sessionId) async {
    try {
      final result = await ucDeleteSession.call(
          params: UcDeleteSessionParams(sessionId: sessionId));
      if (result) {
        session = null;
        isSession = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
