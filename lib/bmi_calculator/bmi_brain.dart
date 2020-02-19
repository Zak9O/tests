import 'dart:math';

enum StateOfBodyWeight { mildThickness, normal, overweight }

class BMIBrain {
  int height;
  int weight;
  double _bmi;

  BMIBrain(this.height, this.weight);

  String calculateBMI() {
    //Formula for BMI=weight/height in the power of 2 (in meters)
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // ignore: missing_return
  String determineBodyState() {
    print(_bmi);
    if (_bmi < 18.5) {
      return "Underweight";
    } else if (25 < _bmi) {
      return "Overweight";
    } else {
      return "Normal";
    }
  }

  String createInterpretation() {
    if (_bmi < 18.5) {
      return "You are underweight. Start eating some cake!";
    } else if (25 < _bmi) {
      return "You are overweight. Eat less cake!";
    } else {
      return "You are of normal bodyweight. Good job!";
    }
  }
}
