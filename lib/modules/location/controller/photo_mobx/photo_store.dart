import 'dart:developer';

import 'package:locate_me/modules/location/data/models/photo.dart';
import 'package:locate_me/modules/location/data/usecase_location/use_case.dart';
import 'package:mobx/mobx.dart';

part 'photo_store.g.dart';

class PhotoStore = PhotoStoreBase with _$PhotoStore;

abstract class PhotoStoreBase with Store {
  final UcCreatePhoto ucCreatePhoto;
  final UcDeletePhoto ucDeletePhoto;
  final UcGetPhotoByLocationId ucGetPhotoByLocationId;

  PhotoStoreBase(
      {required this.ucCreatePhoto,
      required this.ucDeletePhoto,
      required this.ucGetPhotoByLocationId});

  @observable
  bool isLoading = false;
  @observable
  bool isCreated = false;
  @observable
  bool isDelete = false;
  @observable
  bool isAddLocationToFriend = false;
  @observable
  String? errorMessage;
  @observable
  List<Photo> photoList = [];

  @action
  Future<void> addFriend(Photo photo) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result =
          await ucCreatePhoto.call(params: UcCreatePhotoParams(photo: photo));
      if (!result) {
        errorMessage = "No pudo crear la photo. Intente mas tarde";
      }
      isCreated = result;
    } catch (e) {
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> getPhotoByLocationId(int locationId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucGetPhotoByLocationId.call(
          params: UcGetPhotoByLocationIdParams(locationId: locationId));

      photoList = result;
    } catch (e) {
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> deleteFriend(int photoId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucDeletePhoto.call(
          params: UcDeletePhotoParams(photoId: photoId));

      isDelete = result;
    } catch (e) {
      log(e.toString());
      errorMessage = e.toString();
    }
  }
}
