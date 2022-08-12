import 'package:bmi_calculator/model/calculator_brain.dart';
import 'package:bmi_calculator/view/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/view/widgets/divided_box.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({Key? key, required this.heigth, required this.weight})
      : super(key: key);

  final int heigth;
  final int weight;

  String getBMI() {
    return CalculatorBrain(heigth, weight).calculateBMI();
  }

  String getInterpretation() {
    return CalculatorBrain(heigth, weight).resultInterpretation().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Your Result',
                  style: kYourResultStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: DividedBox(
              color: Color(0xFF1C1C2D),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getInterpretation(),
                    style: kResultTypeStyle,
                  ),
                  Text(
                    getBMI(),
                    style: kResultWeight,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 23.0, right: 23.0),
                    child: Text(
                      'You have a higher than normal body weight. Try to exercise more.',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BottomButton(
                label: 'RE-CALCULATE',
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
