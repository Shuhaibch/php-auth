import 'dart:convert';

class SignUp {
    final String email;
    final String password;

    SignUp({
        required this.email,
        required this.password,
    });

    SignUp copyWith({
        String? email,
        String? password,
    }) => 
        SignUp(
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory SignUp.fromRawJson(String str) => SignUp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
