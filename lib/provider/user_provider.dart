import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _email = "";
  String? get email => _email;
  set email(String? newVal) {
    _email = newVal;
    notifyListeners();
  }

  String? _password = "";
  String? get password => _password;
  set password(String? newVal) {
    _password = newVal;
    notifyListeners();
  }

  String? _token = "";
  String? get token => _token;
  set token(String? newVal) {
    _token = newVal;
    notifyListeners();
  }
}
