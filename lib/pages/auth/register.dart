import 'package:fastfoodapp/controllers/registerController.dart';
import 'package:fastfoodapp/pages/home.dart';
import 'package:fastfoodapp/pages/auth/login.dart';
import 'package:fastfoodapp/providers/authProvider.dart';
import 'package:fastfoodapp/providers/registerProvider.dart';
import 'package:fastfoodapp/services/authService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/widgets/inputText.dart';
import 'package:fastfoodapp/widgets/inputPassword.dart';
import 'package:fastfoodapp/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  static String id = 'register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  AuthService authService = AuthService();
  bool isLoading = false;

  final registerController = RegisterController();

  String? emailError = null;
  String? nameError = null;
  String? passwordError = null;
  String? passwordRepeatError = null;

  register() async {
    nameError = null;
    emailError = null;
    passwordError = null;
    passwordRepeatError = null;

    List response = registerController.validateRegisterForm(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordRepeatController.text);

    response.forEach((element) {
      if (element["field"] == 'email') {
        emailError = element["description"];
      }

      if (element["field"] == 'name') {
        nameError = element["description"];
      }

      if (element["field"] == 'password') {
        passwordError = element["description"];
      }

      if (element["field"] == 'passwordRepeat') {
        passwordRepeatError = element["description"];
      }
    });

    Provider.of<RegisterProvider>(context, listen: false)
        .setErrors(nameError, emailError, passwordError, passwordRepeatError);

    if (response.isNotEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    final registerResponse = await registerController.register(
        nameController.text, emailController.text, passwordController.text);

    setState(() {
      isLoading = false;
    });

    if (registerResponse["success"] == true) {
      if (registerResponse["data"]["success"] == true) {
        authService.setOauthToken(registerResponse["data"]["accessToken"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: "home"),
                builder: (context) => Home()),
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
            leading: BackButton(color: Colors.black),
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
                  Text(AppLocalizations.of(context)!.gettingStarted,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  Text(AppLocalizations.of(context)!.createAccountContinue,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 40),
                  InputText(
                    label: AppLocalizations.of(context)!.name,
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    errorText: context.watch<RegisterProvider>().getNameError,
                  ),
                  SizedBox(height: 20),
                  InputText(
                    label: AppLocalizations.of(context)!.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    errorText: context.watch<RegisterProvider>().getEmailError,
                  ),
                  SizedBox(height: 20),
                  InputPassword(
                    label: AppLocalizations.of(context)!.password,
                    controller: passwordController,
                    errorText:
                        context.watch<RegisterProvider>().getPasswordError,
                  ),
                  SizedBox(height: 20),
                  InputPassword(
                    label: AppLocalizations.of(context)!.repeatPassword,
                    controller: passwordRepeatController,
                    errorText: context
                        .watch<RegisterProvider>()
                        .getPasswordRepeatError,
                  ),
                  SizedBox(height: 20),
                  Button(
                      executeAction: register,
                      label: AppLocalizations.of(context)!.createAccount,
                      isLoading: isLoading),
                  SizedBox(height: 20),
                  Center(
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.grey[600]),
                        text: AppLocalizations.of(context)!.alreadyHaveAccount,
                        children: [
                          TextSpan(
                            text: " " + AppLocalizations.of(context)!.signIn,
                            style: TextStyle(
                                color: Colors.green[200],
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  ),
                          ),
                        ])),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
