import 'package:flutter/material.dart';
import 'package:my_frist_project/modules/attendance_app/home_screen/home_screen.dart';
import 'package:my_frist_project/shared/components/components.dart';

class ReportScreen extends StatelessWidget {

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
            navigateTo(context, AttendanceHomeScreen());
          },
        ),
        title: Text(
          'Report',
          style: TextStyle(
            color: Color.fromRGBO(22, 29, 111, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children:
        [
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children:
              [
                Column(
                  children:
                  [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(252, 122, 85, 1),
                      ),
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children:
                  [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(252, 122, 85, 1),
                      ),
                    ),
                    Text(
                      '12',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Present',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children:
                  [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(252, 122, 85, 1),
                      ),
                    ),
                    Text(
                      '80',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Absent',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
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


                  ],
                ),
              ),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 11,
            ),
          ),
        ],
      ),
    );
  }
}
