import 'package:isar/isar.dart';
import 'package:locate_me/modules/location/data/models/location.dart';

class LocationRepository {
  final Isar isar;

  LocationRepository({required this.isar});

  Future<bool> createLocation(Location location) async {
    return await isar.writeTxn(() async {
      final created = await isar.locations.put(location);
      if (created <= 0) {
        return false;
      }
      return true;
    });
  }

  Future<List<Location>> getLocationsByUserId(int userId) async {
    return await isar.locations.filter().userIdEqualTo(userId).findAll();
  }

  Future<bool> addPhotoToLocation(int locationId, List<int> photosID) async {
    final Location? location = await isar.locations.get(locationId);

    if (location == null) {
      return false;
    }

    return await isar.writeTxn(() async {
      location.photoId = photosID;

      final updated = await isar.locations.put(location);
      if (updated <= 0) {
        return throw Exception("No pudo editar la tarea. Intente mas tarde");
      }
      return true;
    });
  }

  Future<bool> deleteLocation(int locationId) async {
    return await isar.writeTxn(() async {
      final deleted = await isar.locations.delete(locationId);
      if (!deleted) {
        return false;
      }
      return deleted;
    });
  }
}
