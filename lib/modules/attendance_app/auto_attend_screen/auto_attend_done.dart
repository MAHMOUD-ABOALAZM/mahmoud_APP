import 'package:flutter/material.dart';
import 'package:my_frist_project/modules/attendance_app/Thank_you_screen/Thank_you_screen.dart';
import 'package:my_frist_project/modules/attendance_app/auto_attend_screen/auto_attend_screen.dart';
import 'package:my_frist_project/shared/components/components.dart';

class AutoAttendanceDoneScreen extends StatefulWidget {
  @override
  _AutoAttendanceDoneScreenState createState() =>
      _AutoAttendanceDoneScreenState();
}

class _AutoAttendanceDoneScreenState extends State<AutoAttendanceDoneScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 193, 79, 1),
        elevation: 0.0,
        titleSpacing: 20,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(22, 29, 111, 1),
          onPressed: () {
            navigateTo(context, AutoAttendanceScreen());
          },
        ),
        title: Text(
          'Auto Attendance',
          style: TextStyle(
            color: Color.fromRGBO(22, 29, 111, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 193, 79, 1),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(50),
                bottomEnd: Radius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://www.pavilionweb.com/wp-content/uploads/2017/03/man-300x300.png',
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Mahmoud Khaled',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[900],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          '2cs',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '9:25',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Checkbox(
                      activeColor: Colors.blue,
                      value: isChecked,
                      onChanged: (bool value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 11,
            ),
          ),
          defaultButton(
            function: () {
              navigateTo(context, ThankYouScreen());
            },
            radius: 20,
            width: 200,
            text: 'done',
            isUpperCase: true,
            background: Color.fromRGBO(22, 29, 111, 1),
          ),
        ],
      ),
    );
  }
}
