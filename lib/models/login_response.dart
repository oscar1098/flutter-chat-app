// To parse this JSON data, do
//
//     final loginReponse = loginReponseFromJson(jsonString);

import 'dart:convert';

import 'package:chat_app/models/usuario.dart';

LoginReponse loginReponseFromJson(String str) => LoginReponse.fromJson(json.decode(str));

String loginReponseToJson(LoginReponse data) => json.encode(data.toJson());

class LoginReponse {
    final bool ok;
    final Usuario usuario;
    final String token;

    LoginReponse({
        required this.ok,
        required this.usuario,
        required this.token,
    });

    factory LoginReponse.fromJson(Map<String, dynamic> json) => LoginReponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
    };
}


