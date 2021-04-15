
import 'package:fitness/NavigationBar/navigationBar.dart';
import 'package:fitness/UI/homeScreen.dart';
import 'package:fitness/demo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum Category {
  workout,
  diet,
}

class CategoryScreen extends StatefulWidget {
  static String id = 'Category';
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryScreen> {
  Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1D343C),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF1D343C),
      body: Column(
        children: <Widget>[
          Container(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'What is your Category?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Container(
              child: GridView.extent(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 200.0,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: category == Category.workout
                              ? activeCardColour
                              : inactiveCardColour,
                          borderRadius: BorderRadius.circular(18.0),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('ImageAsset/dumbbell.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Workout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                     onTap: (){
                        setState(() {
                          category = Category.workout;
                        });
                        print('workout');
                     },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: category == Category.diet
                            ? activeCardColour
                            : inactiveCardColour,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('ImageAsset/diet.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Diet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          category = Category.diet;
                        });
                        print('Diet');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    color: Color(0xFF8ADBD3),
                    onPressed: () {
                      Navigator.pushNamed(context, NavigationBar.id);
                    },
                    child: Text('Done',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.0,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
