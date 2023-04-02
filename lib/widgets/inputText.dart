import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  String label;
  TextInputType keyboardType;
  String? errorText;
  TextEditingController controller;

  OutlineInputBorder customBorder = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2, //<-- SEE HERE
      color: Colors.grey[200]!,
    ),
    borderRadius: BorderRadius.circular(15.0),
  );

  OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2, //<-- SEE HERE
      color: Colors.red[200]!,
    ),
    borderRadius: BorderRadius.circular(15.0),
  );

  InputText(
      {Key? key,
      required this.label,
      required this.keyboardType,
      required this.controller,
      this.errorText = null})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            errorText: errorText,
            focusedBorder: customBorder,
            enabledBorder: customBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
          ),
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
      ],
    );
  }
}
