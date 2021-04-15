import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:fitness/UI/height_and_weight_screen.dart';


class AgeScreen extends StatefulWidget {
  static String id = 'AgeScreen';
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _currentValue = 3;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF1D343C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D343C),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                color: Color(0xFF1D343C),
                padding: EdgeInsets.all(25.0),
                child: Text(
                  'What is your age?',
                 style: TextStyle(
                  fontSize: 20,
                   color: Colors.white,
                   fontWeight: FontWeight.w400,
                 ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              NumberPicker(
                value: _currentValue,
                minValue: 0,
                maxValue: 100,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
                axis: Axis.horizontal,
                onChanged: (value) => setState(() => _currentValue = value),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '$_currentValue YEARS OLD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: Container(
                   padding: EdgeInsets.only(top: double.minPositive),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     RaisedButton(
                       elevation: 10,
                       color: Colors.indigoAccent,
                       onPressed: () {
                         Navigator.pushNamed(context,WeightHeight.id);
                       },
                       child: Text(
                         'Next',
                         style: TextStyle(
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
