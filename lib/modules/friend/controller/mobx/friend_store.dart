import 'dart:developer';

import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/friend/data/usecase/use_case.dart';
import 'package:mobx/mobx.dart';

part 'friend_store.g.dart';

class FriendStore = FriendStoreBase with _$FriendStore;

abstract class FriendStoreBase with Store {
  final UcAddFriend ucAddFriend;
  final UcAddLocationToFriend ucAddLocationToFriend;
  final UcGetFrienByUserId ucGetFrienByUserId;
  final UcDeleteFriend ucDeleteFriend;

  FriendStoreBase({
    required this.ucAddFriend,
    required this.ucAddLocationToFriend,
    required this.ucGetFrienByUserId,
    required this.ucDeleteFriend,
  });

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
  List<Friend> friendList = [];

  @action
  Future<void> addFriend(Friend friend) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result =
          await ucAddFriend.call(params: UcAddFriendParams(friend: friend));
      if (!result) {
        errorMessage = "No pudo agregar un amigo. Intente mas tarde";
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
  Future<void> addLocationToFriend(int friendId, List<int> locations) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucAddLocationToFriend.call(
          params: UcAddLocationToFriendParams(
              friendId: friendId, locations: locations));
      if (!result) {
        errorMessage = "No pudo agregar la ubicacion. Intente mas tarde";
      }
      isAddLocationToFriend = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> getFriendByUserId(int userId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucGetFrienByUserId.call(
          params: UcGetFrienByUserIdParams(userId: userId));

      friendList = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> deleteFriend(int friendId) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await ucDeleteFriend.call(
          params: UcDeleteFriendParams(friendId: friendId));

      isDelete = result;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      log(e.toString());
      errorMessage = e.toString();
    }
  }
}
