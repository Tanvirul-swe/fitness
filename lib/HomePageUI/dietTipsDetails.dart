import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fitness/ConstantValue/dietPlanDetails.dart';

class DietTipsDetails extends StatelessWidget {
  static String id = 'DietTipsDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('ImageAsset/food1.jpg'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Diet Plan Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 15,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Instructions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$brackfast',
                      style: TextStyle(
                        color: Color(0xFF1D343C),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$details_of_brackfast',
                      style: TextStyle(
                        color: Color(0xFF8F92A1),
                        height: 1.5,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Lunch(700 Calories)',
                      style: TextStyle(
                        color: Color(0xFF1D343C),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Staying low, take a slow, lateral step to the right. Keep your toes pointed forward and stay low. Extend the left knee, driving your weight to the right, flexing the knee and hip into a side lunge. Maintain good posture through the entire spine, keeping your head and chest up.',
                      style: TextStyle(
                        color: Color(0xFF8F92A1),
                        fontSize: 15.0,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Dinner(300 Calories)',
                      style: TextStyle(
                        color: Color(0xFF1D343C),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Staying low, take a slow, lateral step to the right. Keep your toes pointed forward and stay low. Extend the left knee, driving your weight to the right, flexing the knee and hip into a side lunge. Maintain good posture through the entire spine, keeping your head and chest up.',
                      style: TextStyle(
                        color: Color(0xFF8F92A1),
                        fontSize: 15.0,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
