import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({
    Key key,
    this.color,
    this.text,
    this.onpress,
  });

  final Color color;
  final String text;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return InkResponse(
      splashColor: Colors.red,
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.002,
          vertical: height * 0.016,
        ),
        alignment: Alignment.center,
        height: size.height * 0.1,
        width: size.width * 0.2,
        decoration: BoxDecoration(
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
