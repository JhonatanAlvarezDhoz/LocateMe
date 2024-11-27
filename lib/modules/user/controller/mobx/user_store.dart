import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  // final LoginUseCase loginUseCase;
  // final RefreshTokenUseCase refreshTokenUseCase;
  // final RegisterUseCase registerUseCase;
  // Otros casos de uso...

  UserStoreBase(
      // required this.loginUseCase,
      // required this.refreshTokenUseCase,
      // required this.registerUseCase,
      // Otros parámetros...
      );

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      // Lógica de inicio de sesión similar a tu Bloc
      // final result = await loginUseCase.call(email, password);

      // // Manejar resultado
      // result.fold(
      //   (failure) {
      //     errorMessage = failure.message;
      //   },
      //   (user) {
      //     // Manejar usuario logueado
      //   }
      // );
      log("message");
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
