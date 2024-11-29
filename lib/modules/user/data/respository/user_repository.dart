import 'package:isar/isar.dart';
import 'package:locate_me/modules/user/data/models/user.dart';

class UserRepository {
  final Isar isar;

  UserRepository({required this.isar});

  Future<bool> createUser(User user) async {
    return await isar.writeTxn(() async {
      final created = await isar.users.put(user);
      if (created <= 0) {
        return false;
      }
      return true;
    });
  }

  Future<List<User>> getUsers() async {
    return await isar.users.where().findAll();
  }

  Future<User?> getUsersById(int userId) async {
    return await isar.users.filter().idEqualTo(userId).findFirst();
  }

  Future<bool> updateUser(int userId, User user) async {
    final userToEdit = await isar.users.get(userId);
    if (userToEdit == null) {
      return false;
    }
    return await isar.writeTxn(() async {
      userToEdit.firstName = user.firstName;
      userToEdit.lastName = user.lastName;
      userToEdit.phoneNumber = user.phoneNumber;
      userToEdit.email = user.email;
      final updated = await isar.users.put(userToEdit);
      if (updated <= 0) {
        return throw Exception("No pudo editar la tarea. Intente mas tarde");
      }
      return true;
    });
  }

  Future<bool> changeUserPassword(int userId, String password) async {
    final userToEdit = await isar.users.get(userId);
    if (userToEdit == null) {
      return false;
    }
    return await isar.writeTxn(() async {
      userToEdit.password = password;
      final updated = await isar.users.put(userToEdit);
      if (updated <= 0) {
        return throw Exception("No pudo editar la tarea. Intente mas tarde");
      }
      return true;
    });
  }

  Future<bool> changeUserProfilePhoto(int userId, String pictureBase64) async {
    final userToEdit = await isar.users.get(userId);
    if (userToEdit == null) {
      return false;
    }
    return await isar.writeTxn(() async {
      userToEdit.profilePhoto = pictureBase64;
      final updated = await isar.users.put(userToEdit);
      if (updated <= 0) {
        return throw Exception("No pudo editar la tarea. Intente mas tarde");
      }
      return true;
    });
  }

  Future<bool> deleteUser(int userId) async {
    return await isar.writeTxn(() async {
      final deleted = await isar.users.delete(userId);
      if (!deleted) {
        return false;
      }
      return deleted;
    });
  }
}
