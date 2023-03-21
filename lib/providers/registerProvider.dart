import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier{

  String? _nameError = null;
  String? _emailError = null;
  String? _passwordError = null;
  String? _passwordRepeatError = null;

  setErrors(nameError, emailError, passwordError, passwordRepeatError){

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

    _nameError = nameError;
    _emailError = emailError;
    _passwordError = passwordError;
    _passwordRepeatError = passwordRepeatError;

    notifyListeners();

  }

  String? get getNameError => _nameError;
  String? get getEmailError => _emailError;
  String? get getPasswordError => _passwordError;
  String? get getPasswordRepeatError => _passwordRepeatError;

}