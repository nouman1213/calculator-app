import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  Widget btn(var text, var pick) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + text;
          });
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black87, fontSize: 30),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(pick),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          ),
        ),
      ),
    );
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  erase() {
    setState(() {
      result = result.substring(0, result.length - 1);
    });
  }

  output() {
    setState(() {
      Parser p = Parser();
      Expression exp = p.parse(result);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        result = eval.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.19,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white, width: 2)),
            ),
            child: Center(
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: clear,
                    child: Text(
                      "AC",
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                      ),
                    ),
                  ),
                ),
                btn("+/-", Colors.orange),
                btn("%", Colors.orange),
                btn("/", Colors.orange),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("7", Colors.white),
                btn("8", Colors.white),
                btn("9", Colors.white),
                btn("*", Colors.orange),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("4", Colors.white),
                btn("5", Colors.white),
                btn("6", Colors.white),
                btn("-", Colors.orange),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1", Colors.white),
                btn("2", Colors.white),
                btn("3", Colors.white),
                btn("+", Colors.orange),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(child: btn("0", Colors.white)),
                btn(".", Colors.white),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: erase,
                    child: Icon(Icons.backspace),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                    onPressed: output,
                    child: Text(
                      "=",
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
