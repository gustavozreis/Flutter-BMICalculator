import 'package:bmi_calculator/view/widgets/divided_box.dart';
import 'package:bmi_calculator/view/widgets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 180;

  void updateCardColor(Gender gender) {
    if (gender == Gender.MALE) {
      maleCardColor = kActiveCardColor;
      femaleCardColor = kInactiveCardColor;
    } else if (gender == Gender.FEMALE) {
      maleCardColor = kInactiveCardColor;
      femaleCardColor = kActiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DividedBox(
                      onPress: () {
                        setState(() {
                          updateCardColor(Gender.MALE);
                        });
                      },
                      color: maleCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      )),
                ),
                Expanded(
                  child: DividedBox(
                    onPress: () {
                      setState(() {
                        updateCardColor(Gender.FEMALE);
                      });
                    },
                    color: femaleCardColor,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DividedBox(
                    color: Color(0xFF1C1C2D),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kTextStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: kHeightTextStyle,
                            ),
                            Text(
                              'CM',
                              style: kTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 14.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DividedBox(
                    color: Color(0xFF1C1C2D),
                  ),
                ),
                Expanded(
                  child: DividedBox(
                    color: Color(0xFF1C1C2D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
