import 'dart:developer';

import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/modules/user/data/usecase/use_case.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final UcCreateUser ucCreateUser;
  final UcUpdateUser ucUpdateUser;
  final UcChangePassword ucChangePassword;
  final UcChangeProfilePhoto ucChangeProfilePhoto;
  final UcDeleteUser ucDeleteUser;
  final UcGetUsersNoParams getUsersNoParams;
  final UcLoginUser ucLoginUser;

  UserStoreBase({
    required this.ucCreateUser,
    required this.ucUpdateUser,
    required this.ucChangePassword,
    required this.ucChangeProfilePhoto,
    required this.ucDeleteUser,
    required this.getUsersNoParams,
    required this.ucLoginUser,
  });

  @observable
  int? userId;
  @observable
  bool isLoading = false;
  @observable
  bool isCreated = false;
  @observable
  bool isLogin = false;
  @observable
  bool isDelete = false;
  @observable
  bool isChangePassword = false;
  @observable
  String? errorMessage;
  @observable
  String? message;
  @observable
  List<User> userList = [];

  @action
  Future<void> createUser(User user) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result =
          await ucCreateUser.call(params: UcCreateUserParams(user: user));
      if (!result) {
        errorMessage = "No pudo crear el usuario. Intente mas tarde";
      }
      isCreated = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> loginUser(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucLoginUser.call(
          params: UcLoginUserParams(email: email, password: password));
      if (!result[0]) {
        errorMessage = "Usuario o contraseña invalidos";
      } else {
        isLogin = result[0];
        userId = result[1];
      }

      isLoading = false;
    } catch (e) {
      isLoading = false;
      log("Hols ${e.toString()}");
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> getUsers() async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await getUsersNoParams.call();

      userList = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> updateUser(int userId, User user) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucUpdateUser.call(
          params: UcUpdateUserParams(userId: userId, user: user));

      isDelete = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> changePassword(int userId, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucChangePassword.call(
          params: UcChangePasswordParams(userId: userId, password: password));

      isChangePassword = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> changeProfilePhoto(int userId, String pictureBase64) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucChangeProfilePhoto.call(
          params: UcChangeProfilePhotoParams(
              userId: userId, pictureBase64: pictureBase64));

      isChangePassword = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> deleteUser(int userId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result =
          await ucDeleteUser.call(params: UcDeleteUserParams(userId: userId));

      isDelete = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }
}
