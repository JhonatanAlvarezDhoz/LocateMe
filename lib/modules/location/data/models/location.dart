import 'dart:convert';

import 'package:isar/isar.dart';

part 'location.g.dart';

@collection
class Location {
  Id? id = Isar.autoIncrement;

  @Index(unique: true)
  String name;

  double latitude;
  double longitude;
  String description;
  List<int>? photoId;
  int userId;

  Location({
    this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
    this.photoId,
    required this.userId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        photoId: json["photoId"]
            ? List<int>.from(json["photoId"].map((x) => x))
            : null,
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "photoId":
            photoId == null ? null : List<int>.from(photoId!.map((x) => x)),
        "userId": userId,
      };
}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
