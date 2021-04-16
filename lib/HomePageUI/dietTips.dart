import 'package:fitness/HomePageUI/dietTipsDetails.dart';
import 'package:flutter/material.dart';

class DietTips extends StatefulWidget {
  static String id = 'DietTips';
  @override
  _DietTipsState createState() => _DietTipsState();
}

class _DietTipsState extends State<DietTips> {
  List calories = [
    "1500 Kcal",
    "1300 Kcal",
    "1200 Kcal",
    "1000 Kcal",
    "900 Kcal",
    "800 Kcal",
  ];
  List content = [
    "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.",
    "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.",
    "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.",
    "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.",
    "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position.",
    "Assume an athletic standing position, with the knees and hips slightly bent, feet shoulder-width apart, and the head and chest up. This will be your starting position."
  ];
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                image: DecorationImage(
                  image: AssetImage('ImageAsset/food1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35.0),
                      topLeft: Radius.circular(35.0)),
                  boxShadow: [
                    BoxShadow(
                      // spreadRadius: 5,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) => Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DietTipsDetails.id);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.green,
                                    backgroundImage:
                                        AssetImage("ImageAsset/food1.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        calories[index],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        content[index],
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.0,
                                        ),
                                        maxLines: 3,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            ' 15 min',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.local_fire_department,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                '250 Kcal',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
