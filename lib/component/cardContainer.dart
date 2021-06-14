import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/component/card.dart';
import 'package:bmi_calculator/main.dart';
class cardContainer extends StatelessWidget {


  final Color cardColor;
  final Widget child;
  cardContainer({ this.cardColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.2,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.04,),
      decoration:BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: child,
    );
  }
}

