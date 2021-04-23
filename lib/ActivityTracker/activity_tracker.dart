import 'package:flutter/material.dart';

class ActivityTracker extends StatefulWidget {
  static String id = 'ActivityTracker';
  @override
  _ActivityTrackerState createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white),
        ),
      ),
    );
  }
}
