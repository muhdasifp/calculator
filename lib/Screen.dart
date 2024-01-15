import 'package:calculator/button.dart';
import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String input = '';
  String output = '0';

  void inputHandle(String taped) async {
    if (taped == 'AC') {
      setState(() {
        input = '';
        output = '';
      });
    } else if (taped == "DEL") {
      setState(() {
        input = '';
      });
    } else if (taped == "=") {
      final finalInput = input.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel contextModel = ContextModel();
      setState(() {
        output = '${exp.evaluate(EvaluationType.REAL, contextModel)}=';
      });
    } else {
      setState(() {
        input = input + taped;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        child: Text(input,
                            style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerRight,
                    child: Text(output,
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
            const Divider(color: btn2),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            onTap: () {
                              inputHandle('AC');
                            },
                            text: 'AC',
                            function: false,
                            equal: false),
                        MyButton(
                            onTap: () {
                              inputHandle('%');
                            },
                            text: '%',
                            function: false),
                        MyButton(
                            onTap: () {
                              inputHandle('/');
                            },
                            text: '/',
                            function: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            onTap: () {
                              inputHandle('7');
                            },
                            text: '7'),
                        MyButton(
                            onTap: () {
                              inputHandle('8');
                            },
                            text: '8'),
                        MyButton(
                            onTap: () {
                              inputHandle('9');
                            },
                            text: '9'),
                        MyButton(
                            onTap: () {
                              inputHandle('x');
                            },
                            text: '*',
                            function: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            onTap: () {
                              inputHandle('4');
                            },
                            text: '4'),
                        MyButton(
                            onTap: () {
                              inputHandle('5');
                            },
                            text: '5'),
                        MyButton(
                            onTap: () {
                              inputHandle('6');
                            },
                            text: '6'),
                        MyButton(
                            onTap: () {
                              inputHandle('-');
                            },
                            text: '-',
                            function: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            onTap: () {
                              inputHandle('1');
                            },
                            text: '1'),
                        MyButton(
                            onTap: () {
                              inputHandle('2');
                            },
                            text: '2'),
                        MyButton(
                            onTap: () {
                              inputHandle('3');
                            },
                            text: '3'),
                        MyButton(
                            onTap: () {
                              inputHandle('+');
                            },
                            text: '+',
                            function: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            onTap: () {
                              inputHandle('00');
                            },
                            text: '00'),
                        MyButton(
                            onTap: () {
                              inputHandle('.');
                            },
                            text: '.'),
                        MyButton(
                            onTap: () {
                              inputHandle('0');
                            },
                            text: '0'),
                        MyButton(
                          onTap: () {
                            inputHandle('=');
                          },
                          text: '=',
                          function: false,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
