import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_frist_project/modules/attendance_app/login_screen/login_screen.dart';
import 'package:my_frist_project/shared/components/components.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 3), () {
        navigateAndFinish(context, AttendanceLoginScreen());
    }
    );
  }
  
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children:
            [
              Expanded(
                child: Container(
                  child: Image(
                      image: AssetImage('assets/images/splash.jpeg',),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
