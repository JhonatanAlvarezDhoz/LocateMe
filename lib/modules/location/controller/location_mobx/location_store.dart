import 'dart:developer';

import 'package:locate_me/modules/location/data/models/location.dart';
import 'package:locate_me/modules/location/data/usecase_location/use_case.dart';
import 'package:mobx/mobx.dart';

part 'location_store.g.dart';

class LocationStore = LocationStoreBase with _$LocationStore;

abstract class LocationStoreBase with Store {
  final UcCreateLocation ucCreateLocation;
  final UcGetLocationByUserId ucGetLocationByUserId;
  final UcAddPhotoToLocation ucAddPhotoToLocation;
  final UcDeleteLocation ucDeleteLocation;

  LocationStoreBase({
    required this.ucCreateLocation,
    required this.ucGetLocationByUserId,
    required this.ucAddPhotoToLocation,
    required this.ucDeleteLocation,
  });

  @observable
  bool isLoading = false;
  @observable
  bool isCreated = false;
  @observable
  bool isDelete = false;
  @observable
  bool isAddPhotoToLocation = false;
  @observable
  String? errorMessage;
  @observable
  String? message;
  @observable
  List<Location> locationList = [];

  @action
  Future<void> createLocation(Location location) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucCreateLocation.call(
          params: UcCreateLocationParams(location: location));
      if (!result) {
        errorMessage = "No pudo crear la ubicacion. Intente mas tarde";
      }

      isCreated = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> getLocationByUserId(int userId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucGetLocationByUserId.call(
          params: UcGetLocationByUserIdParams(userId: userId));

      locationList = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> addLocationToFriend(int locationId, List<int> photoIds) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucAddPhotoToLocation.call(
          params: UcAddPhotoToLocationParams(
              locationId: locationId, photoIds: photoIds));
      if (!result) {
        errorMessage = "No pudo agregar la ubicacion. Intente mas tarde";
      }
      isAddPhotoToLocation = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> deleteFriend(int locationId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucDeleteLocation.call(
          params: UcDeleteLocationParams(locationId: locationId));

      isDelete = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }
}
