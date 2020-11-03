import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_perfection/model/calculator_logic.dart';

class OutPutDisplay extends StatelessWidget {
  const OutPutDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final inputDisplay = Provider.of<Calculator>(context, listen: true).value;
    final result =
        Provider.of<Calculator>(context, listen: true).evaluatedOutput;

    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(top: size.height * 0.05),
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
                  color: Colors.white, fontSize: size.longestSide * 0.03),
            ),
          ),
          Spacer(),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              result,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.longestSide * 0.04,
                  backgroundColor: Colors.red.withOpacity(0.2)),
            ),
          ),
        ],
      ),
    );
  }
}
