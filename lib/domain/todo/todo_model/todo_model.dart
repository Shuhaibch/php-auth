import 'dart:convert';

class Todo {
  final bool status;
  final Success success;

  Todo({
    required this.status,
    required this.success,
  });

  Todo copyWith({
    bool? status,
    Success? success,
  }) =>
      Todo(
        status: status ?? this.status,
        success: success ?? this.success,
      );

  factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        status: json["status"],
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success.toJson(),
      };
}

class Success {
  final String userId;
  final String title;
  final String discription;
  final String id;
  final int v;

  Success({
    required this.userId,
    required this.title,
    required this.discription,
    required this.id,
    required this.v,
  });

  Success copyWith({
    String? userId,
    String? title,
    String? discription,
    String? id,
    int? v,
  }) =>
      Success(
        userId: userId ?? this.userId,
        title: title ?? this.title,
        discription: discription ?? this.discription,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Success.fromRawJson(String str) => Success.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        userId: json["userId"],
        title: json["title"],
        discription: json["discription"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "discription": discription,
        "_id": id,
        "__v": v,
      };
}
