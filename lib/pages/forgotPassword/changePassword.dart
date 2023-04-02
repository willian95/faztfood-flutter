import 'package:fastfoodapp/controllers/forgotPasswordController.dart';
import 'package:fastfoodapp/controllers/loginController.dart';
import 'package:fastfoodapp/helpers/toastHelper.dart';
import 'package:fastfoodapp/pages/auth/login.dart';
import 'package:fastfoodapp/pages/forgotPassword/forgotPassword.dart';
import 'package:fastfoodapp/pages/home.dart';
import 'package:fastfoodapp/pages/auth/register.dart';
import 'package:fastfoodapp/providers/forgotPasswordProvider.dart';
import 'package:fastfoodapp/providers/loginProvider.dart';
import 'package:fastfoodapp/services/authService.dart';
import 'package:fastfoodapp/widgets/pinCode.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/widgets/inputText.dart';
import 'package:fastfoodapp/widgets/inputPassword.dart';
import 'package:fastfoodapp/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  ToastHelper toastHelper = ToastHelper();
  final forgotPasswordController = ForgotPasswordController();
  bool isLoading = false;

  String? passwordError = null;
  String? passwordRepeatError = null;

  changePassword() async {
    passwordError = null;
    passwordRepeatError = null;

    List response = forgotPasswordController.validateThirdStepForm(
        passwordController.text, passwordRepeatController.text);

    response.forEach((element) {
      if (element["field"] == 'password') {
        passwordError = element["description"];
      }

      if (element["field"] == 'passwordRepeat') {
        passwordRepeatError = element["description"];
      }
    });

    Provider.of<ForgotPasswordProvider>(context, listen: false)
        .setErrorsThirdStep(passwordError, passwordRepeatError);

    if (response.isNotEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    final changePasswordResponse = await forgotPasswordController.thirdStep(
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .getEmailForRecovery,
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .getCodeForRecovery,
        passwordController.text);

    setState(() {
      isLoading = false;
    });

    if (changePasswordResponse["success"] == true) {
      if (changePasswordResponse["data"]["success"] == true) {
        toastHelper.showToast(AppLocalizations.of(context)!.passwordChanged);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey.shade50,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.newPassword,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  Text(AppLocalizations.of(context)!.chooseNewPassword,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 40),
                  InputPassword(
                      label: AppLocalizations.of(context)!.password,
                      controller: passwordController,
                      errorText: context
                          .watch<ForgotPasswordProvider>()
                          .getPasswordError),
                  SizedBox(height: 20),
                  InputPassword(
                    label: AppLocalizations.of(context)!.repeatPassword,
                    controller: passwordRepeatController,
                    errorText: context
                        .watch<ForgotPasswordProvider>()
                        .getPasswordRepeatError,
                  ),
                  SizedBox(height: 20),
                  Button(
                      executeAction: changePassword,
                      label: AppLocalizations.of(context)!.finishStep,
                      isLoading: isLoading),
                ],
              ),
            ),
          )),
    );
  }
}
