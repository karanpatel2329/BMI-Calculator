import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class button extends StatelessWidget {
  button({this.icon,  this.pressed});
  final IconData icon;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 6.0,
      fillColor: Colors.grey[800],
      shape: CircleBorder(),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
    );
  }
}
