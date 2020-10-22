import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pagination/widgets/home.dart';
import 'package:pagination/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int value;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if(token == null){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
    }
    else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => HomeScreen()));
    }

  }

  

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: ScaleAnimatedTextKit(
                  onTap: () {
                    
                  },
                  text: [
                    "Welcome",
                  ],
                  textStyle:
                      TextStyle(fontSize: 70.0, fontFamily: "Canterbury"),
                  textAlign: TextAlign.center,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
