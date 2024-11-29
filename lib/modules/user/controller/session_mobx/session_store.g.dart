// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessionStore on SessionStoreBase, Store {
  late final _$isSessionAtom =
      Atom(name: 'SessionStoreBase.isSession', context: context);

  @override
  bool get isSession {
    _$isSessionAtom.reportRead();
    return super.isSession;
  }

  @override
  set isSession(bool value) {
    _$isSessionAtom.reportWrite(value, super.isSession, () {
      super.isSession = value;
    });
  }

  late final _$isCreatedAtom =
      Atom(name: 'SessionStoreBase.isCreated', context: context);

  @override
  bool get isCreated {
    _$isCreatedAtom.reportRead();
    return super.isCreated;
  }

  @override
  set isCreated(bool value) {
    _$isCreatedAtom.reportWrite(value, super.isCreated, () {
      super.isCreated = value;
    });
  }

  late final _$isDeleteAtom =
      Atom(name: 'SessionStoreBase.isDelete', context: context);

  @override
  bool get isDelete {
    _$isDeleteAtom.reportRead();
    return super.isDelete;
  }

  @override
  set isDelete(bool value) {
    _$isDeleteAtom.reportWrite(value, super.isDelete, () {
      super.isDelete = value;
    });
  }

  late final _$sessionAtom =
      Atom(name: 'SessionStoreBase.session', context: context);

  @override
  Session? get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(Session? value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
  }

  late final _$createSesseionAsyncAction =
      AsyncAction('SessionStoreBase.createSesseion', context: context);

  @override
  Future<void> createSesseion(Session session) {
    return _$createSesseionAsyncAction.run(() => super.createSesseion(session));
  }

  late final _$getSesseionAsyncAction =
      AsyncAction('SessionStoreBase.getSesseion', context: context);

  @override
  Future<void> getSesseion() {
    return _$getSesseionAsyncAction.run(() => super.getSesseion());
  }

  late final _$deleteSesseionAsyncAction =
      AsyncAction('SessionStoreBase.deleteSesseion', context: context);

  @override
  Future<void> deleteSesseion(int sessionId) {
    return _$deleteSesseionAsyncAction
        .run(() => super.deleteSesseion(sessionId));
  }

  @override
  String toString() {
    return '''
isSession: ${isSession},
isCreated: ${isCreated},
isDelete: ${isDelete},
session: ${session}
    ''';
  }
}
