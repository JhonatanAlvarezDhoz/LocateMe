// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotoStore on PhotoStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'PhotoStoreBase.isLoading', context: context);

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
      Atom(name: 'PhotoStoreBase.isCreated', context: context);

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
      Atom(name: 'PhotoStoreBase.isDelete', context: context);

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

  late final _$isAddLocationToFriendAtom =
      Atom(name: 'PhotoStoreBase.isAddLocationToFriend', context: context);

  @override
  bool get isAddLocationToFriend {
    _$isAddLocationToFriendAtom.reportRead();
    return super.isAddLocationToFriend;
  }

  @override
  set isAddLocationToFriend(bool value) {
    _$isAddLocationToFriendAtom.reportWrite(value, super.isAddLocationToFriend,
        () {
      super.isAddLocationToFriend = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'PhotoStoreBase.errorMessage', context: context);

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

  late final _$photoListAtom =
      Atom(name: 'PhotoStoreBase.photoList', context: context);

  @override
  List<Photo> get photoList {
    _$photoListAtom.reportRead();
    return super.photoList;
  }

  @override
  set photoList(List<Photo> value) {
    _$photoListAtom.reportWrite(value, super.photoList, () {
      super.photoList = value;
    });
  }

  late final _$addFriendAsyncAction =
      AsyncAction('PhotoStoreBase.addFriend', context: context);

  @override
  Future<void> addFriend(Photo photo) {
    return _$addFriendAsyncAction.run(() => super.addFriend(photo));
  }

  late final _$getPhotoByLocationIdAsyncAction =
      AsyncAction('PhotoStoreBase.getPhotoByLocationId', context: context);

  @override
  Future<void> getPhotoByLocationId(int locationId) {
    return _$getPhotoByLocationIdAsyncAction
        .run(() => super.getPhotoByLocationId(locationId));
  }

  late final _$deleteFriendAsyncAction =
      AsyncAction('PhotoStoreBase.deleteFriend', context: context);

  @override
  Future<void> deleteFriend(int photoId) {
    return _$deleteFriendAsyncAction.run(() => super.deleteFriend(photoId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isCreated: ${isCreated},
isDelete: ${isDelete},
isAddLocationToFriend: ${isAddLocationToFriend},
errorMessage: ${errorMessage},
photoList: ${photoList}
    ''';
  }
}
