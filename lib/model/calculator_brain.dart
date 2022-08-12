import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.heigth, this.weight);

  final int heigth;
  final int weight;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(heigth / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String resultInterpretation() {
    if (_bmi >= 25) {
      return 'Overweigth';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
