import 'package:fastfoodapp/controllers/loginController.dart';
import 'package:fastfoodapp/pages/forgotPassword/forgotPassword.dart';
import 'package:fastfoodapp/pages/home.dart';
import 'package:fastfoodapp/pages/auth/register.dart';
import 'package:fastfoodapp/providers/loginProvider.dart';
import 'package:fastfoodapp/services/authService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/widgets/inputText.dart';
import 'package:fastfoodapp/widgets/inputPassword.dart';
import 'package:fastfoodapp/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService authService = AuthService();
  final loginController = LoginController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  String? emailError = null;
  String? passwordError = null;

  login() async {
    emailError = null;
    passwordError = null;

    List response = loginController.validateLoginForm(
        emailController.text, passwordController.text);

    response.forEach((element) {
      if (element["field"] == 'email') {
        emailError = element["description"];
      }

      if (element["field"] == 'password') {
        passwordError = element["description"];
      }
    });

    Provider.of<LoginProvider>(context, listen: false)
        .setErrors(emailError, passwordError);

    if (response.isNotEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });
    final loginResponse = await loginController.login(
        emailController.text, passwordController.text);

    setState(() {
      isLoading = false;
    });
    print(loginResponse);
    if (loginResponse["success"] == true) {
      if (loginResponse["data"]["success"] == true) {
        authService.setOauthToken(loginResponse["data"]["accessToken"]);
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
                  Text(AppLocalizations.of(context)!.welcome,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  Text(AppLocalizations.of(context)!.welcomeSubtitle,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 40),
                  InputText(
                      label: AppLocalizations.of(context)!.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      errorText: context.watch<LoginProvider>().getEmailError),
                  SizedBox(height: 20),
                  InputPassword(
                    label: AppLocalizations.of(context)!.password,
                    controller: passwordController,
                    errorText: context.watch<LoginProvider>().getPasswordError,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                              AppLocalizations.of(context)!.forgotPassword,
                              style: TextStyle(color: Colors.green[200])))
                    ],
                  ),
                  SizedBox(height: 20),
                  Button(
                      executeAction: login,
                      label: AppLocalizations.of(context)!.login,
                      isLoading: isLoading),
                  SizedBox(height: 40),
                  Center(
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.grey[600]),
                        text: AppLocalizations.of(context)!.noAccount,
                        children: [
                          TextSpan(
                            text: " " + AppLocalizations.of(context)!.signUp,
                            style: TextStyle(
                                color: Colors.green[200],
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
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
