// To parse this JSON data, do
//
//     final authData = authDataFromJson(jsonString);

import 'dart:convert';

AuthData authDataFromJson(String str) => AuthData.fromJson(json.decode(str));

String authDataToJson(AuthData data) => json.encode(data.toJson());

class AuthData {
  bool success;
  Data data;
  Meta meta;

  AuthData({
    required this.success,
    required this.data,
    required this.meta,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
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
  String accessToken;
  String refreshToken;

  Data({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
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