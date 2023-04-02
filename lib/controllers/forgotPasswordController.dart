import 'package:fastfoodapp/helpers/toastHelper.dart';
import 'package:fastfoodapp/services/httpStatusService.dart';
import 'package:fastfoodapp/utils/httpUtil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordController {
  HttpUtil httpUtil = HttpUtil();
  HttpStatusService httpStatus = HttpStatusService();
  ToastHelper toastHelper = ToastHelper();

  List validateFirstStepForm(
    String email,
  ) {
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    List errors = [];

    if (email.isEmpty) {
      errors.add({"field": "email", "description": "fieldRequired"});
    }

    if (!email.isEmpty && !regex.hasMatch(email)) {
      errors.add({"field": "email", "description": "emailNotValid"});
    }

    return errors;
  }

  firstStep(email) async {
    Object data = {"email": email};

    final response = await httpUtil.httpPost("/forgot-password", data);

    if (response["status"] == httpStatus.SUCCESS) {
      return response;
    }

    if (response.toString().contains("data")) {
      toastHelper.showToast(response["data"]["message"]);
    } else {
      toastHelper.showToast(response["message"]);
    }

    return {"success": false};
  }

  List validateSecondStepForm(
    String code,
  ) {
    List errors = [];

    if (code.isEmpty) {
      errors.add({"field": "code", "description": "fieldRequired"});
    }

    if (code.length < 6) {
      errors.add({"field": "code", "description": "codeIncomplete"});
    }

    return errors;
  }

  secondStep(email, code) async {
    Object data = {"email": email, "code": code};

    final response = await httpUtil.httpPost("/verify-password-code", data);

    if (response["status"] == httpStatus.SUCCESS) {
      return response;
    }

    if (response.toString().contains("data")) {
      toastHelper.showToast(response["data"]["message"]);
    } else {
      toastHelper.showToast(response["message"]);
    }

    return {"success": false};
  }

  List validateThirdStepForm(String password, String passwordRepeat) {
    List errors = [];

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

  thirdStep(email, code, password) async {
    Object data = {"email": email, "code": code, "password": password};

    final response = await httpUtil.httpPost("/change-password", data);

    if (response["status"] == httpStatus.SUCCESS) {
      return response;
    }

    if (response.toString().contains("data")) {
      toastHelper.showToast(response["data"]["message"]);
    } else {
      toastHelper.showToast(response["message"]);
    }

    return {"success": false};
  }
}
