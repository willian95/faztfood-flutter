import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatelessWidget {
  TextEditingController controller;
  PinCode({
    Key? key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PinCodeTextField(
      controller: controller,
      boxShadows: [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.white,
          blurRadius: 20,
        )
      ],
      appContext: context,
      length: 6,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      textStyle: TextStyle(color: Colors.black),
      cursorColor: Colors.white,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        borderRadius: BorderRadius.circular(15),
        fieldHeight: 60,
        activeColor: Colors.black,
        inactiveFillColor: Colors.white,
        inactiveColor: Colors.black,
        fieldWidth: 45,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
