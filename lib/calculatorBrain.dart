import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain{
  int height;
  int weight;
  int age;
  double _bmi;
  CalculatorBrain({this.height,this.weight,this.age});

  String bMIResult(){
    print("Inside2");
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String result() {
    print("Inside");
    print(_bmi);
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}