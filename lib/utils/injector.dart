// import 'package:mobx/mobx.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// stores

class Injector {
  static List<SingleChildWidget> dependencies = [
    Provider<UserStore>(
      create: (_) => UserStore(),
    ),
    // Provider<UserStore>(
    //   create: (_) => UserStore(),
    // ),
    // Provider<FriendStore>(
    //   create: (_) => FriendStore(),
    // ),
    // Puedes convertir tus BlocProviders existentes a Providers de MobX
    // Por ejemplo:
    // Provider<LoginStore>(
    //   create: (_) => LoginStore(
    //     loginUseCase: LoginUseCase(repository: LoginRepository()),
    //     // otras dependencias
    //   ),
    // )
  ];
}
