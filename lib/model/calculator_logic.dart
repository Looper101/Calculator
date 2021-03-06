import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends ChangeNotifier {
  String _value = '0';
  String get value => _value;
  String _evaluatedOutPut = '0';
  String get evaluatedOutput => _evaluatedOutPut;

  void setValue(String newValue) {
    Parser p = Parser();
    String stringifiedValue;
    notifyListeners();
    stringifiedValue = _value = _value + newValue;
    Expression exp = p.parse(stringifiedValue);
    notifyListeners();
    _evaluatedOutPut = exp.evaluate(EvaluationType.REAL, null).toString();
    notifyListeners();
  }

  void clearValue() {
    _value = '0';
    _evaluatedOutPut = '0';
    notifyListeners();
  }

  void deleteValue() {
    _value.substring(1);
    notifyListeners();
  }
}
