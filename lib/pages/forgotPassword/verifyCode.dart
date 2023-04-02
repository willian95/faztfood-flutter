import 'package:fastfoodapp/controllers/forgotPasswordController.dart';
import 'package:fastfoodapp/controllers/loginController.dart';
import 'package:fastfoodapp/pages/forgotPassword/changePassword.dart';
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

class VerifyCode extends StatefulWidget {
  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController codeController = TextEditingController();
  final forgotPasswordController = ForgotPasswordController();
  bool isLoading = false;

  String codeError = "";

  verifyCode() async {
    codeError = "";

    List response =
        forgotPasswordController.validateSecondStepForm(codeController.text);

    response.forEach((element) {
      if (element["field"] == 'code') {
        codeError = element["description"];
      }
    });

    Provider.of<ForgotPasswordProvider>(context, listen: false)
        .setErrorsSecondStep(codeError);

    if (response.isNotEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    final verifyCodeResponse = await forgotPasswordController.secondStep(
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .getEmailForRecovery,
        codeController.text);

    setState(() {
      isLoading = false;
    });

    if (verifyCodeResponse["success"] == true) {
      if (verifyCodeResponse["data"]["success"] == true) {
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .setCodeForRecovery(codeController.text);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChangePassword()));
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
                  Text(AppLocalizations.of(context)!.verifyCode,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  Text(AppLocalizations.of(context)!.enterVerifyCode,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 40),
                  PinCode(controller: codeController),
                  Text(
                      context
                          .watch<ForgotPasswordProvider>()
                          .getCodeError
                          .toString(),
                      style: TextStyle(color: Colors.red[200], fontSize: 10)),
                  SizedBox(height: 20),
                  Button(
                      executeAction: verifyCode,
                      label: AppLocalizations.of(context)!.continueStep,
                      isLoading: isLoading),
                  SizedBox(height: 40),
                ],
              ),
            ),
          )),
    );
  }
}
