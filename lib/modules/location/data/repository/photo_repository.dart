import 'package:isar/isar.dart';
import 'package:locate_me/modules/location/data/models/photo.dart';

class PhotoRepository {
  final Isar isar;

  PhotoRepository({required this.isar});

  Future<bool> createPhoto(Photo photo) async {
    return await isar.writeTxn(() async {
      final created = await isar.photos.put(photo);
      if (created <= 0) {
        return false;
      }
      return true;
    });
  }

  Future<List<Photo>> getPhotoByLocationId(int locationId) async {
    return await isar.photos.filter().locationIdEqualTo(locationId).findAll();
  }

  Future<bool> deletePhoto(int locationId) async {
    return await isar.writeTxn(() async {
      final deleted = await isar.photos.delete(locationId);
      if (!deleted) {
        return false;
      }
      return deleted;
    });
  }
}
