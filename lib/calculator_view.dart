import 'package:flutter/material.dart';
import 'package:provider_perfection/components/keypad.dart';
import 'package:provider_perfection/components/output_display.dart';
import 'package:provider_perfection/model/calculator_logic.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final prov = Provider.of<Calculator>(context, listen: false);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OutPutDisplay(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(
                      text: 'AC',
                      onpress: () {
                        prov.clearValue();
                      },
                      color: Colors.red,
                    ),
                    KeyPad(
                      text: '+/-',
                      onpress: () => prov.setValue('+'),
                      color: Colors.red,
                    ),
                    KeyPad(
                      text: '%',
                      onpress: () => prov.setValue('%'),
                      color: Colors.red,
                    ),
                    KeyPad(
                      text: '/',
                      onpress: () => prov.setValue('/'),
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(
                      text: '7',
                      onpress: () => prov.setValue('7'),
                    ),
                    KeyPad(
                      text: '8',
                      onpress: () => prov.setValue('8'),
                    ),
                    KeyPad(
                      text: '9',
                      onpress: () => prov.setValue('9'),
                    ),
                    KeyPad(
                      text: 'x',
                      onpress: () => prov.setValue('*'),
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(
                      text: '4',
                      onpress: () => prov.setValue('4'),
                    ),
                    KeyPad(
                      text: '5',
                      onpress: () => prov.setValue('5'),
                    ),
                    KeyPad(
                      text: '6',
                      onpress: () => prov.setValue('6'),
                    ),
                    KeyPad(
                      text: '-',
                      onpress: () => prov.setValue('-'),
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(
                      text: '1',
                      onpress: () => prov.setValue('1'),
                    ),
                    KeyPad(
                      text: '2',
                      onpress: () => prov.setValue('2'),
                    ),
                    KeyPad(
                      text: '3',
                      onpress: () => prov.setValue('3'),
                    ),
                    KeyPad(
                      text: '+',
                      onpress: () => prov.setValue('+'),
                      color: Colors.red,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: KeyPad(
                          text: '0',
                          onpress: () => prov.setValue('0'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
