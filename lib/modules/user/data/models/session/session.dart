import 'dart:convert';

import 'package:isar/isar.dart';

part 'session.g.dart';

@collection
class Session {
  Id? id = Isar.autoIncrement;
  int userId;
  bool isSession;

  Session({
    this.id,
    required this.userId,
    required this.isSession,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        userId: json["userId"],
        isSession: json["isSession"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "isSession": isSession,
      };
}

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());
