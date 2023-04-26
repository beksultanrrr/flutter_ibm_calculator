import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';



class iconContent extends StatelessWidget {
  iconContent(this.icon, this.text);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 20),
        Text(
          text,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
