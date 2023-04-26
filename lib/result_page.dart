import 'package:flutter/material.dart';
import 'package:flutter122/constants.dart';
import 'reusblecard.dart';
import 'bottombutton.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: yourResultLabel,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: inactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: ResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ), onPress: () {  },
            ),
          ),
          BottomButton(
            buttonText: "Re-Calculate",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
