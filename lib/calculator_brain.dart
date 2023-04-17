import 'dart:math';

class calculatorBrain {
  calculatorBrain(this.height, this.weight);

  final int height;
  final int weight;
  late int bmi;

  void calculate() {
    bmi = (weight / pow(height / 100, 2)).round();
  }

  String getResult() {
    if (bmi > 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInter() {
    if (bmi > 25) {
      return "You have a higher than normal body weight. Try to exercise more";
    } else if (bmi > 18.5) {
      return "You have a normal weight. Good job";
    } else {
      return "You have a lower than normal body weight . You can eat a bit more";
    }
  }
}
