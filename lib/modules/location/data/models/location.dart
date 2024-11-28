import 'dart:convert';

import 'package:isar/isar.dart';

part 'location.g.dart';

@collection
class Location {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  final String name;

  final double latitude;
  final double longitude;
  final String description;
  final List<String> photos;
  final String userId;
  String? friendId;

  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.photos,
    required this.userId,
    this.friendId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        userId: json["userId"],
        friendId: json["friendId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "userId": userId,
        "friendId": friendId,
      };
}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
