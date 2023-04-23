import 'package:flutter/material.dart';

class SubtitlesWidget extends StatelessWidget {
  @override
  String text;

  SubtitlesWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        ],
      ),
    );
  }
}
