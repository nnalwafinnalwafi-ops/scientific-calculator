import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ScientificCalculatorApp());
}

class ScientificCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      theme: ThemeData.dark(),
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String input = "";
  String result = "0";

  void press(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
      } else if (value == "=") {
        calculate();
      } else {
        input += value;
      }
    });
  }

  void calculate() {
    try {
      if (input.contains("sin")) {
        result = sin(double.parse(input.replaceAll("sin", ""))).toString();
      } else if (input.contains("cos")) {
        result = cos(double.parse(input.replaceAll("cos", ""))).toString();
      } else if (input.contains("tan")) {
        result = tan(double.parse(input.replaceAll("tan", ""))).toString();
      } else if (input.contains("√")) {
        result = sqrt(double.parse(input.replaceAll("√", ""))).toString();
      } else {
        result = input;
      }
    } catch (e) {
      result = "Error";
    }
  }

  Widget button(String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () => press(text),
          child: Text(text, style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }

  Widget buildRow(List<String> list) {
    return Row(
      children: list.map((e) => button(e)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scientific Calculator"),
      ),
      body: Column(
        children: [

          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                input,
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),

          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                result,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          buildRow(["7","8","9","/"]),
          buildRow(["4","5","6","*"]),
          buildRow(["1","2","3","-"]),
          buildRow(["0",".","+","="]),
          buildRow(["sin","cos","tan","√"]),
          buildRow(["C"]),
        ],
      ),
    );
  }
}
