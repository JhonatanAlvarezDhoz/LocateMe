import 'dart:convert';

import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String firstName;
  String lastName;

  @Index(unique: true)
  String email;

  @Index(unique: true)
  String phoneNumber;

  String password;
  String? profilePhoto;
  List<int>? friendId;
  List<int>? locationId;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.profilePhoto,
    this.friendId,
    this.locationId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        profilePhoto: json["profilePhoto"],
        friendId: json["friendId"] != null
            ? List<int>.from(json["friendId"].map((x) => x))
            : null,
        locationId: json["locationId"] != null
            ? List<int>.from(json["locationId"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "profilePhoto": profilePhoto,
        "friendId":
            friendId != null ? List<int>.from(friendId!.map((x) => x)) : null,
        "locationId": locationId != null
            ? List<int>.from(locationId!.map((x) => x))
            : null,
      };
}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());
