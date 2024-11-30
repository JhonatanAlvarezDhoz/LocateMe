// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FriendStore on FriendStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'FriendStoreBase.isLoading', context: context);

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
      Atom(name: 'FriendStoreBase.isCreated', context: context);

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
      Atom(name: 'FriendStoreBase.isDelete', context: context);

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
      Atom(name: 'FriendStoreBase.isAddLocationToFriend', context: context);

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
      Atom(name: 'FriendStoreBase.errorMessage', context: context);

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

  late final _$friendAtom =
      Atom(name: 'FriendStoreBase.friend', context: context);

  @override
  Friend? get friend {
    _$friendAtom.reportRead();
    return super.friend;
  }

  @override
  set friend(Friend? value) {
    _$friendAtom.reportWrite(value, super.friend, () {
      super.friend = value;
    });
  }

  late final _$friendListAtom =
      Atom(name: 'FriendStoreBase.friendList', context: context);

  @override
  List<Friend> get friendList {
    _$friendListAtom.reportRead();
    return super.friendList;
  }

  @override
  set friendList(List<Friend> value) {
    _$friendListAtom.reportWrite(value, super.friendList, () {
      super.friendList = value;
    });
  }

  late final _$addFriendAsyncAction =
      AsyncAction('FriendStoreBase.addFriend', context: context);

  @override
  Future<void> addFriend(Friend friend) {
    return _$addFriendAsyncAction.run(() => super.addFriend(friend));
  }

  late final _$addLocationToFriendAsyncAction =
      AsyncAction('FriendStoreBase.addLocationToFriend', context: context);

  @override
  Future<void> addLocationToFriend(int friendId, List<int> locations) {
    return _$addLocationToFriendAsyncAction
        .run(() => super.addLocationToFriend(friendId, locations));
  }

  late final _$getFriendByUserIdAsyncAction =
      AsyncAction('FriendStoreBase.getFriendByUserId', context: context);

  @override
  Future<void> getFriendByUserId(int userId) {
    return _$getFriendByUserIdAsyncAction
        .run(() => super.getFriendByUserId(userId));
  }

  late final _$deleteFriendAsyncAction =
      AsyncAction('FriendStoreBase.deleteFriend', context: context);

  @override
  Future<void> deleteFriend(int friendId) {
    return _$deleteFriendAsyncAction.run(() => super.deleteFriend(friendId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isCreated: ${isCreated},
isDelete: ${isDelete},
isAddLocationToFriend: ${isAddLocationToFriend},
errorMessage: ${errorMessage},
friend: ${friend},
friendList: ${friendList}
    ''';
  }
}
