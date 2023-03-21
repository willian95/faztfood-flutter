import 'package:fastfoodapp/pages/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/widgets/inputText.dart';
import 'package:fastfoodapp/widgets/inputPassword.dart';
import 'package:fastfoodapp/widgets/button.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  bool isLoading = false;

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
                Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                Text("Sign in your account", style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                SizedBox(height: 40),
                
                InputText(
                  label: "Email", 
                  keyboardType: TextInputType.emailAddress, 
                  controller: nameController
                ),
                SizedBox(height: 20),
                InputPassword(
                  label: "Password", 
                  controller: passwordController
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){}, child: Text("Forgot password?", style: TextStyle(color: Colors.green[200])))
                  ],
                ),
                SizedBox(height: 20),
                Button(executeAction: (){}, label: "Login", isLoading: isLoading),
                SizedBox(height: 40),
                Center(
                  child: Text.rich(
                    TextSpan(    
                      style: TextStyle(color: Colors.grey[600]),                  
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(color: Colors.green[200], fontWeight: FontWeight.bold),
                          recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()),
                          ),
                        ),
                      ]
                    )
                  ),
                )
              ],
              
            ),
          ),
        )
      ),
    );
  }

}

