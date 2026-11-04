import 'package:flutter/material.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color boxColor = Colors.red;
  void changeColor() {
  setState(() {
    if (boxColor == Colors.red) {
      boxColor = Colors.blue;
    } 
    else if (boxColor == Colors.blue) {
      boxColor = Colors.green;
    } 
    else {
      boxColor = Colors.red;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: changeColor,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: boxColor,
            ),
          ),
        ),
      ),
    );
  }
}