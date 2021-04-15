import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static String id = 'ProfileScreen';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        color: Colors.orange,
        child: Text('i am profile'),
      ),
    );
  }
}
