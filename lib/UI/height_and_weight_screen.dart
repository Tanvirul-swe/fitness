import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:fitness/UI/category.dart';

class WeightHeight extends StatefulWidget {
  static String id = 'HeightAndWeight';
  @override
  _WeightHeightState createState() => _WeightHeightState();
}

class _WeightHeightState extends State<WeightHeight> {
  int _height = 5;
  int _weight = 20;
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
                    'Final details',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding:  EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Height',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      ),
                    ],
                  ),
                ),
                NumberPicker(
                  value: _height,
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
                  onChanged: (value) => setState(() => _height = value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$_height  CM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),

                SizedBox(
                  height: 80.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(25.0),
                      child: Text('Weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                NumberPicker(
                  value: _weight,
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
                  onChanged: (value) => setState(() => _weight = value),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '$_weight  KG',
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
                            Navigator.pushNamed(context, CategoryScreen.id);
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
