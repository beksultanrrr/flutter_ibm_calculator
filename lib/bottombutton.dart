import 'package:flutter/material.dart';
import 'constants.dart';
import 'result_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonText});
  final Function() onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        // Navigator.pushNamed(context, '/second');
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return ResultPage();
        // }));
      
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20.0),
        height: bottomContainerHeight,
        width: double.infinity,
        color: bottomContainerColor,
        child: Center(
          child: Text(
            buttonText,
            style: LargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
