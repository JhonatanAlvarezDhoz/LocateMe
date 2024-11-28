import 'dart:convert';

import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  final String firstName;
  final String lastName;

  @Index(unique: true)
  final String email;

  @Index(unique: true)
  final String phoneNumber;

  final String password;
  final String? profilePhoto;
  final List<String> friendId;
  final List<String> locationId;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.profilePhoto,
    required this.friendId,
    required this.locationId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        profilePhoto: json["profilePhoto"],
        friendId: List<String>.from(json["friendId"].map((x) => x)),
        locationId: List<String>.from(json["locationId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "profilePhoto": profilePhoto,
        "friendId": List<dynamic>.from(friendId.map((x) => x)),
        "locationId": List<dynamic>.from(locationId.map((x) => x)),
      };
}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());
