import 'package:bmi_calculator/view/widgets/divided_box.dart';
import 'package:bmi_calculator/view/widgets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:bmi_calculator/view/widgets/round_icon_button.dart';
import 'package:bmi_calculator/view/results_page.dart';
import 'package:bmi_calculator/view/widgets/bottom_button.dart';
import 'package:bmi_calculator/model/calculator_brain.dart';

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
  int weigth = 60;
  int age = 30;

  void updateCardColor(Gender gender) {
    if (gender == Gender.MALE) {
      maleCardColor = kActiveCardColor;
      femaleCardColor = kInactiveCardColor;
    } else if (gender == Gender.FEMALE) {
      maleCardColor = kInactiveCardColor;
      femaleCardColor = kActiveCardColor;
    }
  }

  void increaseWeigth() {
    setState(() {
      weigth++;
    });
  }

  void decreaseWeigth() {
    setState(() {
      weigth--;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      age--;
    });
  }

  void calculate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsPage(
                heigth: height,
                weight: weigth,
              )),
    );
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
                    color: const Color(0xFF1C1C2D),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                            const Text(
                              'CM',
                              style: kTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: const Color(0xFF8D8E98),
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 14.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGTH',
                          style: kTextStyle,
                        ),
                        Text(
                          weigth.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPress: increaseWeigth,
                              icon: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPress: decreaseWeigth,
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DividedBox(
                    color: Color(0xFF1C1C2D),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPress: increaseAge,
                                icon: FontAwesomeIcons.plus),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                onPress: decreaseAge,
                                icon: FontAwesomeIcons.minus),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: BottomButton(label: 'CALCULATE', onTap: calculate)),
        ],
      ),
    );
  }
}
