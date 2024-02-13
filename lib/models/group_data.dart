// To parse this JSON data, do
//
//     final groups = groupsFromJson(jsonString);

import 'dart:convert';

GroupData groupsFromJson(String str) => GroupData.fromJson(json.decode(str));

String groupsToJson(GroupData data) => json.encode(data.toJson());

class GroupData {
  bool success;
  List<Group> data;
  Meta meta;

  GroupData({
    required this.success,
    required this.data,
    required this.meta,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
    success: json["success"],
    data: List<Group>.from(json["data"].map((x) => Group.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Group {
  String id;
  Status status;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  Group({
    required this.id,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    status: statusValues.map[json["status"]]!,
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": statusValues.reverse[status],
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "name": name,
  };
}

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "ACTIVE": Status.ACTIVE
});

class Meta {
  int statusCode;
  String message;

  Meta({
    required this.statusCode,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    statusCode: json["statusCode"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
