import 'package:flutter_training/constants/constants.dart';
import 'package:flutter_training/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

dynamic httpGet({
  required BuildContext context,
  required String endpoint,
}) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  Uri url = Uri.parse("$apiURL/$endpoint");

  final response = await http.get(
    url,
    headers: {
      "content-type": "application/json",
      "token": "Bearer ${userProvider.token!}",
      "email": userProvider.email!,
    },
  );
  return response.body;
}

dynamic httpPost({
  required BuildContext context,
  required String endpoint,
  required body,
}) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  Uri url = Uri.parse("$apiURL/$endpoint");

  final response = await http.post(
    url,
    headers: {
      "content-type": "application/json",
      "token": "Bearer ${userProvider.token!}",
      "email": userProvider.email!,
    },
    body: body,
  );
  return response.body;
}
