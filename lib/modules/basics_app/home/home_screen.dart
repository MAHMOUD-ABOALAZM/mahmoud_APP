import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Home_SCRENN extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         backgroundColor:Colors.teal ,
         elevation: 10.0,
         leading: Icon(
           Icons.menu,
         ),
        title: Text(
          'first app'
        ),

        actions:
        [
          IconButton( icon: Icon(
            Icons.search,
          ),
              onPressed: ()
              {
                print('hhh');
              }
              ),
          IconButton(
            onPressed: ()
            {
              print ('hello');
            },
              icon:  Text(
                      'hello')
          ),
          IconButton(
            icon: Icon(
              Icons.notification_add,
            ),
            onPressed: ()
            {
              print ('noti');
            },
          ),

        ],
      ),

      body:Column(
        children:
        [
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children:
                  [
                    Image(
                      image:NetworkImage(
                        'https://pic.i7lm.com/wp-content/uploads/2019/06/Violet-Flowers-Pictures-11.jpg',

                      ),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(.5),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        'flower',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],

      ),




    );


  }

}