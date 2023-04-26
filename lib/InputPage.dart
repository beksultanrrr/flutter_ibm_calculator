import 'package:flutter/material.dart';
import 'package:flutter122/iconContent.dart';
import 'package:flutter122/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusblecard.dart';
import 'constants.dart';
import 'bottombutton.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 74;
  int age = 19;

  // void upgradeColour(Gender gender) {
  //   if (gender == Gender.male) {
  //     maleCardColor = inactiveCardColour ? activeCardColour : inactiveCardColour;
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColour) {
  //       femaleCardColor = activeCardColour;
  //       maleCardColor = inactiveCardColour;
  //     } else {
  //       femaleCardColor = inactiveCardColour;
  //       maleCardColor = activeCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: iconContent(FontAwesomeIcons.mars, "Male"),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: iconContent(FontAwesomeIcons.venus, "FeMale"),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: inactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30)),
                        child: Slider(
                            min: 120,
                            max: 230,
                            inactiveColor: Color(0xFF8D8E98),
                            value: height.toDouble(),
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            })),
                  ],
                ),
                onPress: () {}),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: inactiveCardColour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  operation: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  operation: () {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },
                                ),
                              ]),
                        ]),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: inactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: labelTextStyle),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  operation: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              SizedBox(width: 10),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  operation: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(height1: height, weight1: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: calculatorBrain.calculateBMI(),
                    resultText: calculatorBrain.getResult(),
                    interpretation: calculatorBrain.getInterpretation(),
                  );
                }));
              },
              buttonText: "Calculate")
        ]));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.operation});
  final IconData icon;
  final Function() operation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon, color: Colors.white),
        elevation: 6,
        onPressed: operation,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(width: 56, height: 56),
        fillColor: Color(0xFF4C4F5E));
  }
}
