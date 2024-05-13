
import 'dart:convert';

class LogIn {
    final bool status;
    final String token;

    LogIn({
        required this.status,
        required this.token,
    });

    LogIn copyWith({
        bool? status,
        String? token,
    }) => 
        LogIn(
            status: status ?? this.status,
            token: token ?? this.token,
        );

    factory LogIn.fromRawJson(String str) => LogIn.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LogIn.fromJson(Map<String, dynamic> json) => LogIn(
        status: json["status"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
    };
}
