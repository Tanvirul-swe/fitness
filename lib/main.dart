import 'package:fitness/HomePageUI/dietTips.dart';
import 'package:fitness/MusicPlayer/tracks.dart';
import 'package:fitness/NavigationBar/navigationBar.dart';
import 'package:fitness/UI/ageScreen.dart';
import 'package:fitness/UI/selectGenderScreen.dart';
import 'package:flutter/material.dart';
import 'UI/welcomeScreen.dart';
import 'UI/loginScreen.dart';
import 'UI/registrationScreen.dart';
import 'UI/height_and_weight_screen.dart';
import 'UI/category.dart';
import 'UI/homeScreen.dart';
import 'UI/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         initialRoute: WelcomeScreen.id,
      routes: {
            WelcomeScreen.id:(context)=>WelcomeScreen(),
            LoginScreen.id:(context)=>LoginScreen(),
            Registration.id:(context)=>Registration(),
            GenderScreen.id:(context)=>GenderScreen(),
            AgeScreen.id:(context)=>AgeScreen(),
            WeightHeight.id:(context)=>WeightHeight(),
            CategoryScreen.id:(context)=>CategoryScreen(),
            NavigationBar.id:(context)=>NavigationBar(),
             HomeScreen.id:(context)=>HomeScreen(),
            MusicApp.id:(context)=>MusicApp(),
             Tracks.id:(context)=>Tracks(),
      },
    );
  }
}
