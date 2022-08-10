import 'package:bmi_calculator/view/widgets/divided_box.dart';
import 'package:bmi_calculator/view/widgets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                      color: const Color(0xFF1C1C2D),
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      )),
                ),
                Expanded(
                  child: DividedBox(
                    color: const Color(0xFF1C1C2D),
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
