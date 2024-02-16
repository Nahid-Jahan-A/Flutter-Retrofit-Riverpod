class ClassData {
  bool success;
  List<Class> data;
  Meta meta;

  ClassData({
    required this.success,
    required this.data,
    required this.meta,
  });

  factory ClassData.fromJson(Map<String, dynamic> json) {
    return ClassData(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((classData) => Class.fromJson(classData))
              .toList() ??
          [],
      meta: Meta.fromJson(json['meta'] ?? {}),
    );
  }
}

class Class {
  String id;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  String classTitleEnglish;
  String classTitleBangla;
  Level level;
  List<Group> groups;

  Class({
    required this.id,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.classTitleEnglish,
    required this.classTitleBangla,
    required this.level,
    required this.groups,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      createdBy: json['createdBy'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      classTitleEnglish: json['classTitleEnglish'] ?? '',
      classTitleBangla: json['classTitleBangla'] ?? '',
      level: Level.fromJson(json['level'] ?? {}),
      groups: (json['groups'] as List<dynamic>?)
              ?.map((group) => Group.fromJson(group))
              .toList() ??
          [],
    );
  }
}

class Level {
  String id;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  String name;
  Version version;

  Level({
    required this.id,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.version,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      createdBy: json['createdBy'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      name: json['name'] ?? '',
      version: Version.fromJson(json['version'] ?? {}),
    );
  }
}

class Version {
  String id;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  String name;

  Version({
    required this.id,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      createdBy: json['createdBy'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Group {
  String id;
  String status;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
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

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] ?? '',
      status: json['status'] ?? '',
      createdBy: json['createdBy'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Meta {
  int statusCode;
  String message;

  Meta({
    required this.statusCode,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
    );
  }
}
