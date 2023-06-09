import 'dart:ffi';

import 'package:fastfoodapp/services/httpStatusService.dart';
import 'package:fastfoodapp/utils/httpUtil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterController {
  final httpStatus = HttpStatusService();
  final httpUtil = HttpUtil();

  List validateRegisterForm(
      String name, String email, String password, String passwordRepeat) {
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    List errors = [];

    if (name.isEmpty) {
      errors.add({"field": "name", "description": "fieldRequired"});
    }

    if (email.isEmpty) {
      errors.add({"field": "email", "description": "fieldRequired"});
    }

    if (!email.isEmpty && !regex.hasMatch(email)) {
      errors.add({"field": "email", "description": "emailNotValid"});
    }

    if (password.isEmpty) {
      errors.add({"field": "password", "description": "fieldRequired"});
    }

    if (passwordRepeat.isEmpty) {
      errors.add({"field": "passwordRepeat", "description": "fieldRequired"});
    }

    if (!password.isEmpty &&
        !passwordRepeat.isEmpty &&
        password != passwordRepeat) {
      errors
          .add({"field": "passwordRepeat", "description": "passwordNotMatch"});
    }

    return errors;
  }

  register(name, email, password) async {
    Object data = {"name": name, "email": email, "password": password};

    final response = await httpUtil.httpPost("/register", data);

    if (response["status"] == httpStatus.SUCCESS) {
      return response;
    }

    if (response.toString().contains("data")) {
      Fluttertoast.showToast(
          msg: response["data"]["message"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[200],
          textColor: Colors.black87,
          fontSize: 12.0);
    } else {
      Fluttertoast.showToast(
          msg: response["message"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[200],
          textColor: Colors.black87,
          fontSize: 12.0);
    }

    return {"success": false};
  }
}
