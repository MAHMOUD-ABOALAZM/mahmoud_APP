import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_frist_project/modules/attendance_app/auto_attend_screen/auto_attend_screen.dart';
import 'package:my_frist_project/modules/attendance_app/login_screen/login_screen.dart';
import 'package:my_frist_project/modules/attendance_app/modify_screen/modify_1_screen.dart';
import 'package:my_frist_project/modules/attendance_app/modify_screen/modify_screen.dart';
import 'package:my_frist_project/modules/attendance_app/report_screen/report_1_screen.dart';
import 'package:my_frist_project/modules/attendance_app/report_screen/report_screen.dart';
import 'package:my_frist_project/shared/components/components.dart';

class AttendanceHomeScreen extends StatefulWidget {
  @override
  _AttendanceHomeScreenState createState() => _AttendanceHomeScreenState();
}

class _AttendanceHomeScreenState extends State<AttendanceHomeScreen> {

  bool x = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(22, 29, 111, 1),
        elevation: 0.0,
        titleSpacing: 20,
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: ()
          {
            navigateTo(context, AttendanceLoginScreen());
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr.Mahmoud',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Dr-Mahmoud@sha.edu.eg',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 15,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/d0/fa/ba/d0faba206b495a23095962dd08bffd83.jpg',
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(22, 29, 111, 1),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(50),
                bottomEnd: Radius.circular(50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Your Course',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Stack(
                            children: [
                              GestureDetector(
                                onTap: ()
                                {
                                  setState(() {
                                    x = true;
                                  });
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    //color: isMale ? Colors.blue   :Colors.grey[400],
                                    color:  x ? Color.fromRGBO(255, 193, 79,1)  :  Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Operating System',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Color.fromRGBO(22, 29, 111, 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '3Cs',
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(22, 29, 111, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 25,
                          ),
                          itemCount: 5,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Our Features',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(22, 29, 111, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://finapayment.com/wp-content/uploads/2020/08/shutterstock_618376100spider.jpg',
                                  ),
                                ),
                                TextButton(
                                  onPressed: ()
                                  {
                                    navigateTo(context, AutoAttendanceScreen());
                                  },
                                  child: Text(
                                    'Auto Attendance',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
// overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(22, 29, 111, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWPR_PwetRjgUPbDNVcOIY7XbLdlxQIWT-FQ&usqp=CAU',
                                  ),
                                ),
                                TextButton(
                                  onPressed: ()
                                  {
                                    navigateTo(context, ReportScreen1());
                                  },
                                  child: Text(
                                    'Generate Report',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
// overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(22, 29, 111, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHOa4hTLg_MMK6JraJGi5sp-cAtT1ns027Fg&usqp=CAU',
                              ),
                            ),
                            TextButton(
                              onPressed: ()
                              {
                                navigateTo(context, ModifyScreen1());
                              },
                              child: Text(
                                'Modify Attendance',
                                textAlign: TextAlign.center,
                                maxLines: 2,
// overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(22, 29, 111, 1),
                                ),
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
        ],
      ),
    );
  }
}
