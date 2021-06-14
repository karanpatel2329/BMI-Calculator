import 'package:bmi_calculator/component/card.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/component/cardContainer.dart';
import 'package:bmi_calculator/component/customButtom.dart';
import 'package:bmi_calculator/screen/output_screen.dart';
import 'package:bmi_calculator/calculatorBrain.dart';
enum Gender { male, female }
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color currentColor = kInactiveCardColour;
  Gender selectedGender;
  int height = 120;
  int age=18;
  int weight=40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      //print("Tap Working");
                      //print(currentColor);
                      print(selectedGender);
                      print(currentColor);
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: cardContainer(
                      cardColor: selectedGender != Gender.male
                          ? kInactiveCardColour
                          : kActiveCardColour,
                      child:
                          card(icon: FontAwesomeIcons.mars, labelText: "Male"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        setState(() {
                          selectedGender = Gender.female;
                          print(selectedGender);
                          print(currentColor);
                        });
                      });
                    },
                    child: cardContainer(
                      cardColor: selectedGender != Gender.female
                          ? kInactiveCardColour
                          : kActiveCardColour,
                      child: card(
                          icon: FontAwesomeIcons.venus, labelText: "Female"),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width*0.90,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: kInactiveCardColour,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBigFontStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white10,
                        thumbColor: Colors.pink,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          min: 120.0,
                          max: 300.0,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  cardContainer(
                    cardColor: kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigFontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(icon: FontAwesomeIcons.plus, pressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                            SizedBox(
                              width: 5.0,
                            ),
                            button(icon: FontAwesomeIcons.minus, pressed: (){
                              setState(() {
                                weight--;
                              });
                            },)
                          ],
                        ),
                      ],
                    ),
                  ),
                  cardContainer(
                    cardColor: kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigFontStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(icon: FontAwesomeIcons.plus,pressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                            SizedBox(
                              width: 5.0,
                            ),
                            button(icon: FontAwesomeIcons.minus,pressed: (){
                             setState(() {
                               age--;
                             });
                            },)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: FlatButton(
                minWidth: double.infinity,
                onPressed: (){
                  CalculatorBrain brain = CalculatorBrain(height: height,weight: weight);
                //print(height.toString()+" dd "+weight.toString());
               //  # print(brain.bMIResult());
               // print(brain.result());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Output(BMI: brain.bMIResult(), result: brain.result(),suggestion: brain.interpretation()))
                );
                },
                child: Text("Calculate",
                style: kBigFontStyle,),
                color: Colors.pink,
                splashColor: Colors.pink,
              ),
            )
          ],
        ));
  }
}
