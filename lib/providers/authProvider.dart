import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _accessToken = "";

  setAccessToken(token) {
    _accessToken = token;
    notifyListeners();
  }
}
