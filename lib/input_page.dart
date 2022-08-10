import 'package:bmi_calculator/view/widgets/divided_box.dart';
import 'package:bmi_calculator/view/widgets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerCardColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateCardColor(int gender) {
    if (gender == 1) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else if (gender == 2) {
      maleCardColor = inactiveCardColor;
      femaleCardColor = activeCardColor;
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCardColor(1);
                      });
                    },
                    child: DividedBox(
                        color: maleCardColor,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateCardColor(2);
                      });
                    },
                    child: DividedBox(
                      color: femaleCardColor,
                      cardChild: const IconContent(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
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
