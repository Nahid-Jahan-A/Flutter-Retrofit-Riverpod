// To parse this JSON data, do
//
//     final groups = groupsFromJson(jsonString);

import 'dart:convert';

GroupData groupsFromJson(String str) => GroupData.fromJson(json.decode(str));

String groupsToJson(GroupData data) => json.encode(data.toJson());

class GroupData {
  bool success;
  List<Group> data;
  MetaData meta;

  GroupData({
    required this.success,
    required this.data,
    required this.meta,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
    success: json["success"],
    data: List<Group>.from(json["data"].map((x) => Group.fromJson(x))),
    meta: MetaData.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Group {
  String id;
  Status? status;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
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
    status: json["status"] != null ? statusValues.map[json["status"]] : null,
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": statusValues.reverse[status],
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
  };
}

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "ACTIVE": Status.ACTIVE
});

class MetaData {
  int statusCode;
  String message;

  MetaData({
    required this.statusCode,
    required this.message,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    statusCode: json["statusCode"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
  };
}


class SingleGroupResponse {
  bool success;
  Data data;
  Meta meta;
  Pagination pagination;

  SingleGroupResponse({
    required this.success,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  factory SingleGroupResponse.fromJson(Map<String, dynamic> json) => SingleGroupResponse(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "meta": meta.toJson(),
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  int pageNo;
  int nextPage;
  int totalPages;
  int totalRecords;
  int recordsPerPage;

  Pagination({
    required this.pageNo,
    required this.nextPage,
    required this.totalPages,
    required this.totalRecords,
    required this.recordsPerPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    pageNo: json["page_no"],
    nextPage: json["next_page"],
    totalPages: json["total_pages"],
    totalRecords: json["total_records"],
    recordsPerPage: json["records_per_page"],
  );

  Map<String, dynamic> toJson() => {
    "page_no": pageNo,
    "next_page": nextPage,
    "total_pages": totalPages,
    "total_records": totalRecords,
    "records_per_page": recordsPerPage,
  };
}



class CreateGroupResponse {
  bool success;
  Data data;
  Meta meta;

  CreateGroupResponse({
    required this.success,
    required this.data,
    required this.meta,
  });

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) => CreateGroupResponse(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class Data {
  String id;
  String status;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  Data({
    required this.id,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    status: json["status"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "name": name,
  };
}

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


class DeleteResponse{
  bool success;
  MetaData meta;

  DeleteResponse({
    required this.success,
    required this.meta,
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
    success: json["success"],
    meta: MetaData.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "meta": meta.toJson(),
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
