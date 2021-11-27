import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/components/buttom_button.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf8f8ff),
        appBar: AppBar(
          backgroundColor: const Color(0xFF6c60e0),
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                    colour: Colors.white,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text('Normal', style: kResultTextStyle),
                        Text('18.3', style: kBMITextStyle),
                        Text(
                          'Your BMI is quite low, you should exercise and eat more.',
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
            BottomButton(
              buttonText: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
            )
          ],
        ));
  }
}
