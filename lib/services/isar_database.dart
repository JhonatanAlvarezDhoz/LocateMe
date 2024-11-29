import 'package:isar/isar.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/modules/location/data/models/photo.dart';
import 'package:path_provider/path_provider.dart';

import 'package:locate_me/modules/user/data/models/user.dart';

class IsarDatabase {
  static Future<Isar> get userInstance async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UserSchema],
          directory: directory.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  static Future<Isar> get friendInstance async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([FriendSchema],
          directory: directory.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  static Future<Isar> get locationInstance async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([LocationSchema],
          directory: directory.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  static Future<Isar> get photoInstance async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PhotoSchema],
          directory: directory.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }
}
