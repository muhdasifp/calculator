import 'package:flutter/material.dart';
import 'colors.dart';

class MyButton extends StatelessWidget {
  final bool function;
  final String text;
  final VoidCallback onTap;
  final bool equal;

  const MyButton({
    super.key,
    required this.text,
    this.function = true,
    required this.onTap,
    this.equal = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.blue,
      onTap: onTap,
      child: Container(
        height: 75,
        width: equal ? 80 : 165,
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade50, offset: const Offset(5, 5))
          ],
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 40,
                fontWeight: function ? FontWeight.normal : FontWeight.bold,
                color: function ? Colors.white : fn2),
          ),
        ),
      ),
    );
  }
}
