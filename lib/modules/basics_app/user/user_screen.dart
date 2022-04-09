import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_frist_project/models/user/user_model.dart';



class userScreen extends StatelessWidget {
  List <UsersModel> users =
  [
    UsersModel(
    id: 1,
    name: 'ahmedmm',
    phone: '+0255855455555',
  ),
    UsersModel(
      id: 2,
      name: 'mohamed jbjibi',
      phone: '+025533333333',
    ),
    UsersModel(
      id: 3,
      name: 'abokhilk',
      phone: '+0255000005',
    ),
    UsersModel(
      id: 1,
      name: 'ahmedmm',
      phone: '+0255855455555',
    ),
    UsersModel(
      id: 2,
      name: 'mohamed jbjibi',
      phone: '+025533333333',
    ),
    UsersModel(
      id: 3,
      name: 'abokhilk',
      phone: '+0255000005',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usres',
        ),
      ),
      body:ListView.separated(
          itemBuilder:(context , index) => buildUsersItem(users[index]) ,
          separatorBuilder:(context , index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ) ,
          itemCount: users.length,
      ),
    );
  }
   Widget buildUsersItem(UsersModel user) => Padding(
     padding: const EdgeInsets.all(20.0),
     child: Row(
       children:
       [
         CircleAvatar(
           radius: 30,
           child: Text(
             '${user.id}',
             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
         SizedBox(
           width: 15,
         ),
         Expanded(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment:CrossAxisAlignment.start,
             children:
             [
               Text(
                 '${user.name}',
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),

               ),
               Text(
                 '${user.phone}',
                 style: TextStyle(
                   color: Colors.grey,
                 ),
               ),
             ],
           ),
         ),
       ],
     ),
   );
}
