import 'package:flutter/material.dart';
import 'package:my_frist_project/modules/attendance_app/home_screen/home_screen.dart';
import 'package:my_frist_project/modules/attendance_app/report_screen/report_screen.dart';
import 'package:my_frist_project/shared/components/components.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 29, 111, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/WhatsApp Image 2022-04-01 at 6.46.57 PM.jpeg',
              ),
            ),
            Text(
              'Thank you!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'We are glad to serve you',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            defaultButton(
              function: ()
              {
                navigateTo(context, ReportScreen());
              },
              radius: 20,
              width: 300,
              text: 'Generate Report',
              isUpperCase: true,
              background: Color.fromRGBO(255, 193, 79, 1),
            ),
            SizedBox(
              height: 20,
            ),
            defaultButton(
              function: ()
              {
                navigateTo(context, AttendanceHomeScreen());
              },
              radius: 20,
              width: 300,
              text: 'Continue',
              isUpperCase: true,
              background: Colors.blue.withOpacity(.2),
            ),
          ],
        ),
      ),
    );
  }
}
