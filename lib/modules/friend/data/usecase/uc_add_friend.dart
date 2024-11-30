import 'dart:developer';

import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';

class UcAddFriendParams {
  final Friend friend;

  UcAddFriendParams({required this.friend});
}

class UcAddFriend extends UseCase<List, UcAddFriendParams> {
  final FrinedRepository friendRepository;

  UcAddFriend({required this.friendRepository});
  @override
  Future<List> call({UcAddFriendParams? params}) async {
    try {
      final dynamic response = await friendRepository.addFriend(params!.friend);
      log(response[1].firstName);

      return response;
    } catch (e) {
      log("Catch Adfriend : ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
