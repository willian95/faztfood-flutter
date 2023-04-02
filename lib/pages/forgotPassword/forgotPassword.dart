import 'package:fastfoodapp/controllers/forgotPasswordController.dart';
import 'package:fastfoodapp/pages/forgotPassword/verifyCode.dart';
import 'package:fastfoodapp/providers/forgotPasswordProvider.dart';
import 'package:fastfoodapp/widgets/button.dart';
import 'package:fastfoodapp/widgets/inputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'login';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final forgotPasswordController = ForgotPasswordController();

  String? emailError = null;
  bool isLoading = false;

  nextStep() async {
    emailError = null;
    List response =
        forgotPasswordController.validateFirstStepForm(emailController.text);

    response.forEach((element) {
      if (element["field"] == 'email') {
        emailError = element["description"];
      }
    });

    Provider.of<ForgotPasswordProvider>(context, listen: false)
        .setErrorsFirstStep(emailError);

    if (response.isNotEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    final forgotPasswordResponse =
        await forgotPasswordController.firstStep(emailController.text);

    setState(() {
      isLoading = false;
    });

    if (forgotPasswordResponse["success"] == true) {
      if (forgotPasswordResponse["data"]["success"] == true) {
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .setEmailForRecovery(emailController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VerifyCode()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  Text(AppLocalizations.of(context)!.forgotYourPassword,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  Text(AppLocalizations.of(context)!.getNewOne,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 40),
                  InputText(
                      label: AppLocalizations.of(context)!.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      errorText: context
                          .watch<ForgotPasswordProvider>()
                          .getEmailError),
                  SizedBox(height: 20),
                  Button(
                      executeAction: nextStep,
                      label: AppLocalizations.of(context)!.continueStep,
                      isLoading: isLoading),
                ],
              ),
            ),
          )),
    );
  }
}
