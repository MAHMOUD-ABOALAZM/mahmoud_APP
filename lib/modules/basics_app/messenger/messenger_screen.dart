import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20,
        title: Row(
          children:
          [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://www.wallpapertip.com/wmimgs/30-302331_-.jpg',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions:
        [
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
            Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
          ),
              )),
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5,),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5,),
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection:Axis.horizontal ,
                  itemBuilder: (context , index) => bulidStoryItem(),
                  separatorBuilder: (context , index) =>SizedBox(width: 20,),
                  itemCount: 6,


                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context , index) => bulidChatItem(),
                  separatorBuilder: (context , index) => SizedBox(height: 20,) ,
                  itemCount: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

   Widget bulidChatItem() => Row(
     children:
     [
       Stack(
         alignment: AlignmentDirectional.bottomEnd,
         children:
         [
           CircleAvatar(
             radius: 30,
             backgroundImage: NetworkImage(
               'https://img.youm7.com/ArticleImgs/2018/4/30/26366-%D8%A7%D8%B1%D8%AB%D8%B1-%D8%B4%D9%8A%D9%84%D8%A8%D9%8A.jpg',
             ),
           ),
           Padding(
             padding: const EdgeInsetsDirectional.only(
               bottom: 3,
               end: 3,
             ),
             child: CircleAvatar(
               radius: 8,
               backgroundColor: Colors.green,
             ),
           ),
         ],
       ),
       SizedBox(
         width: 20,
       ),
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:
           [
             Text(
               'Arther Chilby',
               style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
               ),
             ),
             SizedBox(
               height: 8,
             ),
             Row(
               children:
               [
                 Expanded(
                   child: Text(
                     'Fuken Thangreta Tomas Fuken John Tomas Fuken Badly Tomas Fuken Sydic Tomas',
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: Container(
                     height: 8,
                     width: 8,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       shape: BoxShape.circle,
                     ),
                   ),
                 ),
                 Text(
                   '02:20 pm',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
           ],
         ),
       ),

     ],
   );
  Widget bulidStoryItem() =>  Container(
    width: 60,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:
          [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://www.wallpapertip.com/wmimgs/30-302331_-.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Tomas Chlby Elgamed',
          maxLines: 2,
          overflow:TextOverflow.ellipsis ,
          style: TextStyle(
            fontSize:18,
          ),
        ),
      ],
    ),
  );
}
