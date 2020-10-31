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
    final output = Provider.of<Calculator>(context, listen: true).value;
    final prov = Provider.of<Calculator>(context, listen: false);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            height: size.height * 0.3,
            color: Colors.black,
            child: Text(
              output.toString(),
              style: TextStyle(
                  color: Colors.white, fontSize: size.longestSide * 0.1),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(text: 'AC'),
                    KeyPad(text: '+/-'),
                    KeyPad(text: '%'),
                    KeyPad(text: '/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(
                      text: '7',
                      onpress: () {
                        prov.setValue(7);
                      },
                    ),
                    KeyPad(
                      text: '8',
                      onpress: () {
                        prov.setValue(8);
                      },
                    ),
                    KeyPad(text: '9'),
                    KeyPad(text: 'x'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(text: '4'),
                    KeyPad(text: '5'),
                    KeyPad(text: '6'),
                    KeyPad(text: '-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(text: '1'),
                    KeyPad(text: '2'),
                    KeyPad(text: '3'),
                    KeyPad(text: '+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyPad(text: '0'),
                    KeyPad(text: '2'),
                    KeyPad(text: '3'),
                    KeyPad(text: '='),
                  ],
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
    return InkWell(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.002, vertical: size.height * 0.016),
        alignment: Alignment.center,
        height: size.height * 0.1,
        width: size.width * 0.2,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          color: Colors.black,
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
