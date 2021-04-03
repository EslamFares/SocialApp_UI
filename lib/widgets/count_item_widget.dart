
import 'package:flutter/material.dart';

class CountItemWidget extends StatelessWidget {
  const CountItemWidget({
    @required this.upText,
    @required this.downText,
  });

  final String upText;
  final String downText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          upText,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          downText,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
