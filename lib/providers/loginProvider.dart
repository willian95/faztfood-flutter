import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String? _emailError = null;
  String? _passwordError = null;

  setErrors(emailError, passwordError) {
    _emailError = emailError;
    _passwordError = passwordError;

    notifyListeners();
  }

  String? get getEmailError => _emailError;
  String? get getPasswordError => _passwordError;
}
