import 'package:isar/isar.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/modules/location/data/models/photo.dart';
import 'package:locate_me/modules/user/data/models/session/session.dart';
import 'package:path_provider/path_provider.dart';

import 'package:locate_me/modules/user/data/models/user.dart';

class IsarDatabase {
  static Future<Isar> get instance async {
    final directory = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          UserSchema,
          FriendSchema,
          LocationSchema,
          PhotoSchema,
          SessionSchema,
        ],
        directory: directory.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance('default')!);
  }

  // Si aún necesitas instancias separadas, puedes mantener métodos individuales
  static Future<Isar> get userInstance async => instance;
  static Future<Isar> get friendInstance async => instance;
  static Future<Isar> get locationInstance async => instance;
  static Future<Isar> get photoInstance async => instance;
  static Future<Isar> get sessionInstance async => instance;
}
