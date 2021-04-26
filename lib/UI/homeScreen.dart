import 'package:fitness/DietCalculator/dietCalculator.dart';
import 'package:fitness/HomePageUI/dietTips.dart';
import 'package:fitness/HomePageUI/dietTipsDetails.dart';
import 'package:fitness/MusicPlayer/tracks.dart';
import 'package:fitness/NavigatorDrawer/MainDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitness/UI/profile.dart';
import 'package:fitness/NavigationBar/navigationBar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:fitness/Location/location.dart';
import 'package:fitness/NavigatorDrawer/MainDrawer.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double padding = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      padding = 3.5;
    } else {
      padding = 2;
    }
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / padding;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          elevation: 5,
          backgroundColor: Colors.black12,
          title: Text('Home'),
        ),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: MainDrawer(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/4.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('ImageAsset/sixpack.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Color(0xFF1D343C),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32.0),
                    bottomLeft: Radius.circular(32.0)),
              ),
              // height: MediaQuery.of(context).size.height / 3.5,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       IconButton(
                  //           icon: Icon(Icons.menu, color: Colors.white),
                  //           onPressed: () {
                  //             //Do something when clicked menu button.
                  //           }),
                  //       IconButton(
                  //           icon:
                  //               Icon(Icons.notifications, color: Colors.white),
                  //           onPressed: () {
                  //             //Do something when clicked notification button.
                  //           }),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Welcome to \nFitness & Diet',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                // height: MediaQuery.of(context).size.height / 2.2,
                // width: MediaQuery.of(context).size.width,
                child: Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(15),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            color: Color(0xFF9E75FA),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.calculate,
                                color: Colors.white,
                                size: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Diet\nCalculator',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: DietCalculator()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFF52CFC5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.free_breakfast,
                                color: Colors.white,
                                size: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Diet\nPlan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: DietTips()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFFEB5757),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.help_center,
                                color: Colors.white,
                                size: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fitness\nTips',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          //Do something
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFEF9F95),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.track_changes,
                              color: Colors.white,
                              size: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Activity\nTracker',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFFF2994A),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.music_note,
                                color: Colors.white,
                                size: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Music\nPlayer ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: Tracks()));
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: Location()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFF76B8C6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gym\nLocation ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 15.0,
            // ),
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xFF1D343C),
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(32.0),
            //           topRight: Radius.circular(32.0)),
            //     ),
            //
            //     // height: MediaQuery.of(context).size.height,
            //     // width: MediaQuery.of(context).size.width,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
