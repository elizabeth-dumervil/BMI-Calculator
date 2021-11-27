import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf8f8ff),
        appBar: AppBar(
          // backgroundColor: const Color(0xFFa7a0ec),
          backgroundColor: const Color(0xFF6c60e0),
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor1
                          : kInactiveCardColor1,
                      cardChild: IconWidget(
                        icon: FontAwesomeIcons.mars,
                        colorIcon: const Color(0xFF63b3f9),
                        avatarColor: const Color(0xFFf1f9ff),
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kActiveCardColor2
                              : kInactiveCardColor2,
                          cardChild: IconWidget(
                            icon: FontAwesomeIcons.venus,
                            colorIcon: const Color(0xFFf371ce),
                            avatarColor: const Color(0xFFffefff),
                            label: 'FEMALE',
                          ))),
                ],
              )),
              Expanded(
                  child: ReusableCard(
                colour: const Color(0xFFe0d7ff),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFb09cf8),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text('cm', style: kLabelTextStyle)
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.purple.shade200,
                      inactiveColor: const Color(0xFFb09cf8),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: const Color(0xFFb8eedc),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF72c4a8),
                            ),
                          ),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  fillColor: const Color(0xFFe3fff6),
                                  icon: FontAwesomeIcons.minus,
                                  iconColor: const Color(0xFF72c4a8),
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  fillColor: const Color(0xFFe3fff6),
                                  icon: FontAwesomeIcons.plus,
                                  iconColor: const Color(0xFF72c4a8),
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: const Color(0xFFffdfcd),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFfe917a),
                            ),
                          ),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  fillColor: const Color(0xFFfff2eb),
                                  icon: FontAwesomeIcons.minus,
                                  iconColor: const Color(0xFFfe917a),
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  fillColor: const Color(0xFFfff2eb),
                                  icon: FontAwesomeIcons.plus,
                                  iconColor: const Color(0xFFfe917a),
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              BottomButton(
                buttonText: 'CALCULATE',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage()));
                },
              ),
            ]));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.icon,
      required this.iconColor,
      required this.onPress,
      required this.fillColor});

  final IconData icon;
  final Color iconColor;
  final Color fillColor;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: iconColor),
      elevation: 5.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: fillColor,
      onPressed: onPress,
    );
  }
}
