import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fitness/ConstantValue/dietPlanDetails.dart';

class DietTipsDetails extends StatefulWidget {
  static String id = 'DietTipsDetails';

  @override
  _DietTipsDetailsState createState() => _DietTipsDetailsState();
}
ScrollController controller = ScrollController();
bool closeTopContainer = false;
class _DietTipsDetailsState extends State<DietTipsDetails> {

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                alignment: Alignment.topCenter,
                width: size.width,
                height: closeTopContainer ? 0 : size.height * 0.30,
                child: Container(
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
              Expanded(
                child: Container(
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
                    controller: controller,
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
              ),
            ],
          ),
      ),
    );
  }
}
