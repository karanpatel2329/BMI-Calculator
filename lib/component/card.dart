import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constant.dart';
class card extends StatelessWidget {
  const card({
    Key key,
    @required this.icon,
    this.labelText,
  }) : super(key: key);
  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 65.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          labelText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}