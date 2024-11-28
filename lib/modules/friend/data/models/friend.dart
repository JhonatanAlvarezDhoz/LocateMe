import 'dart:convert';

import 'package:isar/isar.dart';

part 'friend.g.dart';

@collection
class Friend {
  Id id = Isar.autoIncrement;
  final String firstName;
  final String lastName;

  @Index(unique: true)
  final String email;

  @Index(unique: true)
  final String phoneNumber;

  final String? profilePhoto;
  final List<String> locationId;

  Friend({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.profilePhoto,
    required this.locationId,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        profilePhoto: json["profilePhoto"],
        locationId: List<String>.from(json["locationId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "profilePhoto": profilePhoto,
        "locationId": List<dynamic>.from(locationId.map((x) => x)),
      };
}

Friend friendFromJson(String str) => Friend.fromJson(json.decode(str));

String friendToJson(Friend data) => json.encode(data.toJson());
