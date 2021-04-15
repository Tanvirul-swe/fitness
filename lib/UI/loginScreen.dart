import 'package:fitness/UI/homeScreen.dart';
import 'package:fitness/UI/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/NavigationBar/navigationBar.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('ImageAsset/workout.jpg'),
            Expanded(
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35.0),
                      topLeft: Radius.circular(35.0)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 10,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Welcome back',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Gmail',
                            icon: Icon(Icons.email),
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            icon: Icon(Icons.security),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, NavigationBar.id);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.indigoAccent,
                        ),
                        TextButton(
                          onPressed: () {
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF8F92A1)),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Registration.id);
                          },
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color(0xFF406360),
                        ),
                      ],
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
