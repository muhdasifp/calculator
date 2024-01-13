import 'package:flutter/material.dart';
import 'colors.dart';

class MyButton extends StatelessWidget {
  bool? function;
  final String text;
  final VoidCallback onTap;

  MyButton({
    super.key,
    required this.text,
    this.function = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.black,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: function! ? [btn1, btn2] : [fn1, fn2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
