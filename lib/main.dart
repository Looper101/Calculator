import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_perfection/calculator_view.dart';
import 'package:provider_perfection/model/calculator_logic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Calculator>(
      create: (context) => Calculator(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: CalculatorView(),
      ),
    );
  }
}
