// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationStore on LocationStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LocationStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isCreatedAtom =
      Atom(name: 'LocationStoreBase.isCreated', context: context);

  @override
  bool get isCreated {
    _$isCreatedAtom.reportRead();
    return super.isCreated;
  }

  @override
  set isCreated(bool value) {
    _$isCreatedAtom.reportWrite(value, super.isCreated, () {
      super.isCreated = value;
    });
  }

  late final _$isDeleteAtom =
      Atom(name: 'LocationStoreBase.isDelete', context: context);

  @override
  bool get isDelete {
    _$isDeleteAtom.reportRead();
    return super.isDelete;
  }

  @override
  set isDelete(bool value) {
    _$isDeleteAtom.reportWrite(value, super.isDelete, () {
      super.isDelete = value;
    });
  }

  late final _$isAddPhotoToLocationAtom =
      Atom(name: 'LocationStoreBase.isAddPhotoToLocation', context: context);

  @override
  bool get isAddPhotoToLocation {
    _$isAddPhotoToLocationAtom.reportRead();
    return super.isAddPhotoToLocation;
  }

  @override
  set isAddPhotoToLocation(bool value) {
    _$isAddPhotoToLocationAtom.reportWrite(value, super.isAddPhotoToLocation,
        () {
      super.isAddPhotoToLocation = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'LocationStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'LocationStoreBase.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$locationListAtom =
      Atom(name: 'LocationStoreBase.locationList', context: context);

  @override
  List<Location> get locationList {
    _$locationListAtom.reportRead();
    return super.locationList;
  }

  @override
  set locationList(List<Location> value) {
    _$locationListAtom.reportWrite(value, super.locationList, () {
      super.locationList = value;
    });
  }

  late final _$createLocationAsyncAction =
      AsyncAction('LocationStoreBase.createLocation', context: context);

  @override
  Future<void> createLocation(Location location) {
    return _$createLocationAsyncAction
        .run(() => super.createLocation(location));
  }

  late final _$getLocationByUserIdAsyncAction =
      AsyncAction('LocationStoreBase.getLocationByUserId', context: context);

  @override
  Future<void> getLocationByUserId(int userId) {
    return _$getLocationByUserIdAsyncAction
        .run(() => super.getLocationByUserId(userId));
  }

  late final _$addLocationToFriendAsyncAction =
      AsyncAction('LocationStoreBase.addLocationToFriend', context: context);

  @override
  Future<void> addLocationToFriend(int locationId, List<int> photoIds) {
    return _$addLocationToFriendAsyncAction
        .run(() => super.addLocationToFriend(locationId, photoIds));
  }

  late final _$deleteFriendAsyncAction =
      AsyncAction('LocationStoreBase.deleteFriend', context: context);

  @override
  Future<void> deleteFriend(int locationId) {
    return _$deleteFriendAsyncAction.run(() => super.deleteFriend(locationId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isCreated: ${isCreated},
isDelete: ${isDelete},
isAddPhotoToLocation: ${isAddPhotoToLocation},
errorMessage: ${errorMessage},
message: ${message},
locationList: ${locationList}
    ''';
  }
}
