import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final Function()? onTap;
  final String txt;

  Mybutton({super.key, required this.onTap, required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 152, 196, 174),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              color: Color.fromARGB(255, 82, 82, 82),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
