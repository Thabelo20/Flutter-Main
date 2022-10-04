import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/utilities/functions.dart';

Future<UserSignInResponse> userSignIn({
  required BuildContext context,
  required UserSignInRequest request,
}) async {
  try {
    String json = jsonEncode(request);

    var response = await httpPost(
      context: context,
      endpoint: "api/v1/security/login",
      body: json,
    );
    Map<String, dynamic> decodedResponse = jsonDecode(response);

    return UserSignInResponse.fromJson(decodedResponse);
  } catch (e) {
    return UserSignInResponse(null);
  }
}

class UserSignInResponse {
  final String? auth;

  UserSignInResponse(this.auth);

  UserSignInResponse.fromJson(Map<String, dynamic> json)
      : auth = json["access_token"];
}

class UserSignInRequest {
  final String? userEmail;
  final String? userPassword;
  final String? database = "db";

  UserSignInRequest({
    this.userEmail,
    this.userPassword,
  });

  Map<String, dynamic> toJson() => {
        "username": userEmail,
        "password": userPassword,
        "provider": database,
      };
}
