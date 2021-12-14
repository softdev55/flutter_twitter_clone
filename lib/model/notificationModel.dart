import 'dart:convert';

import 'package:flutter_twitter_clone/model/user.dart';

class NotificationModel {
  String? id;
  String? tweetKey;
  String? updatedAt;
  late String createdAt;
  late String type;
  late Map<String, dynamic> data;

  NotificationModel(
      {this.id,
      this.tweetKey,
      required this.type,
      required this.createdAt,
      this.updatedAt,
      required this.data});

  NotificationModel.fromJson(String tweetId, Map<dynamic, dynamic> map) {
    id = tweetId;
    final data = json.decode(json.encode(map["data"])) as Map<String, dynamic>;
    tweetKey = tweetId;
    updatedAt = map["updatedAt"];
    type = map["type"];
    createdAt = map["createdAt"];
    this.data = data;
  }

  Map<String, dynamic> toJson() => {
        "tweetKey": tweetKey,
      };
}

extension NotificationModelHelper on NotificationModel {
  UserModel get user => UserModel.fromJson(data);

  DateTime? get timeStamp => DateTime.tryParse(updatedAt ?? createdAt);
}
