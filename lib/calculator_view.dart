import 'dart:io';

import 'package:flutter/material.dart';
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
    final inputDisplay = Provider.of<Calculator>(context, listen: true).value;
    final result =
        Provider.of<Calculator>(context, listen: true).evaluatedOutput;
    final prov = Provider.of<Calculator>(context, listen: false);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            height: size.height * 0.3,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    inputDisplay.toString(),
                    style: TextStyle(
                        color: Colors.white, fontSize: size.longestSide * 0.05),
                  ),
                ),
                Spacer(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    result,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.longestSide * 0.06,
                        backgroundColor: Colors.red.withOpacity(0.3)),
                  ),
                ),
              ],
            ),
          ),
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
                    ),
                    KeyPad(
                      text: '+/-',
                      onpress: () => prov.setValue('+'),
                      color: Colors.red,
                    ),
                    KeyPad(text: '%', onpress: () => prov.setValue('%')),
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
                      // KeyPad(
                      //   color: Colors.red,
                      //   text: '',
                      //   onpress: () => prov.setValue('2'),
                      // ),
                      // KeyPad(
                      //   text: '',
                      //   onpress: () => prov.deleteValue(),
                      // ),
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

class KeyPad extends StatelessWidget {
  const KeyPad({
    Key key,
    this.text,
    this.color,
    this.onpress,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkResponse(
      splashColor: Colors.red,
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.002, vertical: size.height * 0.016),
        alignment: Alignment.center,
        height: size.height * 0.1,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white24,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color ?? Colors.grey,
            fontSize: size.longestSide * 0.04,
          ),
        ),
      ),
    );
  }
}
