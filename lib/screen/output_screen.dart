import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
class Output extends StatelessWidget {
  Output({this.BMI,this.result,this.suggestion});
  final String BMI;
  final String result;
  final String suggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Title(
          child: Text("BIM Calculator"),
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
        child: Column(

          children: [
            Text("Your Result"),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),

                width: MediaQuery.of(context).size.width*0.90,
                decoration: BoxDecoration(
                  color:kInactiveCardColour,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      BMI,
                      style:TextStyle(
                        fontSize: 80.0,
                        fontWeight:FontWeight.w900,
                      ),
                    ),
                    Center(
                      child: Text(
                        suggestion,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),

                  ],

                ),

              ),
            ),
            Container(
              width:double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: FlatButton(
                child: Text("RECALCULATE"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            )
          ],
        )

      ),
    );
  }
}
