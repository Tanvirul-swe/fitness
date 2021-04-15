import 'package:flutter/material.dart';

class ReusableCardValue extends StatelessWidget{

  ReusableCardValue( {@required this.icon,@required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          color: Colors.white,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }

}