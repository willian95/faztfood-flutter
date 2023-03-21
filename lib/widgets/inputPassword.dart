import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget{
  String label;
  TextEditingController controller ;
  String? errorText;
  InputPassword({
    Key? key,
    required this.label,
    required this.controller,
    this.errorText = null
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputPassword();

}
class _InputPassword extends State<InputPassword>{
  bool click = true;

  OutlineInputBorder customBorder =  OutlineInputBorder(
    borderSide:
      BorderSide(
        width: 2, //<-- SEE HERE
        color: Colors.grey[200]!,
      ),
    borderRadius: BorderRadius.circular(15.0),
  );

  OutlineInputBorder errorBorder =  OutlineInputBorder(
    borderSide:
      BorderSide(
        width: 2, //<-- SEE HERE
        color: Colors.red[200]!,
      ),
    borderRadius: BorderRadius.circular(15.0),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        SizedBox(height: 15,),
        TextFormField(
          controller: widget.controller,
          obscureText: click,
          decoration: InputDecoration(
            filled: true,
            errorText: widget.errorText,
            focusedBorder: customBorder,
            enabledBorder: customBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    click = !click;
                  });
                },
                child: click == true ?
                Icon(
                  Icons.visibility,
                  color: Color(0xff071542),
                ) :
                Icon(
                  Icons.visibility_off,
                  color: Color(0xff071542),
                )
            )
          ),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Color(0xff75788D)
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }

}