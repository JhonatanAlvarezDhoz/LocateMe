import 'dart:convert';

import 'package:isar/isar.dart';

part 'photo.g.dart';

@collection
class Photo {
  Id? id = Isar.autoIncrement;
  int locationId;
  String photoBytes;
  double latitude;
  double longitude;

  Photo({
    this.id,
    required this.photoBytes,
    required this.locationId,
    required this.latitude,
    required this.longitude,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        locationId: json["locationId"],
        photoBytes: json["photoBytes"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locationId": locationId,
        "photoBytes": photoBytes,
        "latitude": latitude,
        "longitude": longitude,
      };
}

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());
