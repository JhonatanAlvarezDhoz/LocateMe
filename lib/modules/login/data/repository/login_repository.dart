import 'package:isar/isar.dart';
import 'package:locate_me/modules/user/data/models/user.dart';

class LoginRepository {
  final Isar isar;

  LoginRepository({required this.isar});

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    final User? user =
        await isar.users.filter().emailEqualTo(email).findFirst();
    if (user != null) {
      if (user.password == password) {
        isLogin = true;
      } else {
        isLogin = false;
      }
    }
    return isLogin;
  }
}
