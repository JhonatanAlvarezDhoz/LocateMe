import 'dart:convert';

import 'package:isar/isar.dart';

part 'friend.g.dart';

@collection
class Friend {
  Id id = Isar.autoIncrement;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  int userId;
  String? profilePhoto;
  List<int> locationId;

  Friend({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.userId,
    this.profilePhoto,
    required this.locationId,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        userId: json["userId"],
        profilePhoto: json["profilePhoto"],
        locationId: List<int>.from(json["locationId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "userId": userId,
        "phoneNumber": phoneNumber,
        "profilePhoto": profilePhoto,
        "locationId": List<int>.from(locationId.map((x) => x)),
      };
}

Friend friendFromJson(String str) => Friend.fromJson(json.decode(str));

String friendToJson(Friend data) => json.encode(data.toJson());
