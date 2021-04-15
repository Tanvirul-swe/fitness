import 'package:fitness/UI/ageScreen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/demo/reusableCard.dart';
import 'package:fitness/demo/reusableCardValue.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness/demo/constants.dart';

enum Gender {
  male,
  female,
}

class GenderScreen extends StatefulWidget {
  static String id = 'GenderScreen';

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Gender gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D343C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp,color: Colors.white),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF1D343C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Select your gender',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 200.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = Gender.male;
                            });
                          },
                          child: ReusableCard(
                            colour: gender == Gender.male
                                ? activeCardColour
                                : inactiveCardColour,
                            cardChild: ReusableCardValue(
                              icon: FontAwesomeIcons.mars,
                              label: 'Male',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = Gender.female;
                            });
                          },
                          child: ReusableCard(
                            colour: gender == Gender.female
                                ? activeCardColour
                                : inactiveCardColour,
                            cardChild: ReusableCardValue(
                              icon: FontAwesomeIcons.venus,
                              label: 'Female',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RaisedButton(
                          color: Color(0xFF8B63E6),
                          elevation: 10,
                          onPressed: () {
                            Navigator.pushNamed(context, AgeScreen.id);
                          },
                          child: Text('Next',style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
