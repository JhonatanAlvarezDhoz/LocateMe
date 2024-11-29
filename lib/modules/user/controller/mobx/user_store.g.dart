// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$userIdAtom =
      Atom(name: 'UserStoreBase.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'UserStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isCreatedAtom =
      Atom(name: 'UserStoreBase.isCreated', context: context);

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

  late final _$isLoginAtom =
      Atom(name: 'UserStoreBase.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$isDeleteAtom =
      Atom(name: 'UserStoreBase.isDelete', context: context);

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

  late final _$isChangePasswordAtom =
      Atom(name: 'UserStoreBase.isChangePassword', context: context);

  @override
  bool get isChangePassword {
    _$isChangePasswordAtom.reportRead();
    return super.isChangePassword;
  }

  @override
  set isChangePassword(bool value) {
    _$isChangePasswordAtom.reportWrite(value, super.isChangePassword, () {
      super.isChangePassword = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'UserStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'UserStoreBase.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$userListAtom =
      Atom(name: 'UserStoreBase.userList', context: context);

  @override
  List<User> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<User> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$createUserAsyncAction =
      AsyncAction('UserStoreBase.createUser', context: context);

  @override
  Future<void> createUser(User user) {
    return _$createUserAsyncAction.run(() => super.createUser(user));
  }

  late final _$loginUserAsyncAction =
      AsyncAction('UserStoreBase.loginUser', context: context);

  @override
  Future<void> loginUser(String email, String password) {
    return _$loginUserAsyncAction.run(() => super.loginUser(email, password));
  }

  late final _$getUsersAsyncAction =
      AsyncAction('UserStoreBase.getUsers', context: context);

  @override
  Future<void> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  late final _$updateUserAsyncAction =
      AsyncAction('UserStoreBase.updateUser', context: context);

  @override
  Future<void> updateUser(int userId, User user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(userId, user));
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('UserStoreBase.changePassword', context: context);

  @override
  Future<void> changePassword(int userId, String password) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(userId, password));
  }

  late final _$changeProfilePhotoAsyncAction =
      AsyncAction('UserStoreBase.changeProfilePhoto', context: context);

  @override
  Future<void> changeProfilePhoto(int userId, String pictureBase64) {
    return _$changeProfilePhotoAsyncAction
        .run(() => super.changeProfilePhoto(userId, pictureBase64));
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('UserStoreBase.deleteUser', context: context);

  @override
  Future<void> deleteUser(int userId) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(userId));
  }

  @override
  String toString() {
    return '''
userId: ${userId},
isLoading: ${isLoading},
isCreated: ${isCreated},
isLogin: ${isLogin},
isDelete: ${isDelete},
isChangePassword: ${isChangePassword},
errorMessage: ${errorMessage},
message: ${message},
userList: ${userList}
    ''';
  }
}
