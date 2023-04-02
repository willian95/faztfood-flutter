import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  String? _emailError = null;
  String _emailForRecovery = "";
  String _codeError = "";
  String _codeForRecovery = "";
  String? _passwordError = null;
  String? _passwordRepeatError = null;

  String? get getEmailError => _emailError;
  String get getEmailForRecovery => _emailForRecovery;
  String get getCodeError => _codeError;
  String get getCodeForRecovery => _codeForRecovery;
  String? get getPasswordError => _passwordError;
  String? get getPasswordRepeatError => _passwordRepeatError;

  setErrorsFirstStep(emailError) {
    _emailError = emailError;

    notifyListeners();
  }

  setEmailForRecovery(email) {
    _emailForRecovery = email;
    notifyListeners();
  }

  setErrorsSecondStep(codeError) {
    _codeError = codeError;

    notifyListeners();
  }

  setCodeForRecovery(codeError) {
    _codeForRecovery = codeError;

    notifyListeners();
  }

  setErrorsThirdStep(password, passwordRepeat) {
    _passwordError = password;
    _passwordRepeatError = passwordRepeat;

    notifyListeners();
  }
}
