import 'dart:convert';

import 'package:isar/isar.dart';

part 'photo.g.dart';

@collection
class Photo {
  Id id = Isar.autoIncrement;
  String photoBytes;
  double latitude;
  double longitude;

  Photo({
    required this.photoBytes,
    required this.latitude,
    required this.longitude,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        photoBytes: json["photoBytes"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "photoBytes": photoBytes,
        "latitude": latitude,
        "longitude": longitude,
      };
}

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());
