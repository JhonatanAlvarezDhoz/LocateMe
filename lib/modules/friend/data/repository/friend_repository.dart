import 'package:isar/isar.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';

class FrinedRepository {
  final Isar isar;

  FrinedRepository({required this.isar});

  Future<bool> addFriend(Friend friend) async {
    return await isar.writeTxn(() async {
      final created = await isar.friends.put(friend);
      if (created <= 0) {
        return false;
      }
      return true;
    });
  }

  Future<bool> addLocationToFriend(int friendId, List<int> locations) async {
    final Friend? friendToAddLocation =
        await isar.friends.filter().idEqualTo(friendId).findFirst();

    if (friendToAddLocation == null) {
      return false;
    }
    return await isar.writeTxn(() async {
      friendToAddLocation.locationId = locations;
      final updated = await isar.friends.put(friendToAddLocation);
      if (updated <= 0) {
        return throw Exception(
            "No pudo agregar la ubicación. Intente mas tarde");
      }
      return true;
    });
  }

  Future<List<Friend>> getFriendsByUserId(int userId) async {
    return await isar.friends.filter().userIdEqualTo(userId).findAll();
  }

  Future<bool> deleteFriend(int friendId) async {
    return await isar.writeTxn(() async {
      final deleted = await isar.friends.delete(friendId);
      if (!deleted) {
        return false;
      }
      return deleted;
    });
  }
}
