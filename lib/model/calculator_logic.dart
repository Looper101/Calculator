import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  num _value = 0;
  num get value => _value;

  void setValue(int value) {
    final StringifyedValue = value.toString();
    if (_value == 0) {
      _value = value;
    } else {
      _value = int.parse(StringifyedValue + value.toString());
    }

    notifyListeners();
  }
}
