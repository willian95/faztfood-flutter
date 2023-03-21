import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label;
  final executeAction;
  bool isLoading;

  Button({
    Key? key,
    required this.label,
    required this.executeAction,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.green.shade200,
          ),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 50,
          child: isLoading
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white),
                )
              : Text(
                  label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
        ),
        onPressed: () {
          if (isLoading == false) {
            executeAction();
          }
        },
      ),
    );
  }
}
