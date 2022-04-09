import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_frist_project/shared/components/components.dart';
import 'package:my_frist_project/shared/components/constants.dart';
import 'package:my_frist_project/shared/cubit/cubit.dart';
import 'package:my_frist_project/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class homeLayout extends StatelessWidget
{


  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){
          if (state is AppInsertDatabaseState)
          {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context , AppState state){

          AppCubit cubit =AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body:ConditionalBuilder(
              condition:true ,
              builder:(context) => cubit.screens[cubit.currentIndex] ,
              fallback:(context) => Center(child: CircularProgressIndicator()) ,
            ) ,
            floatingActionButton: FloatingActionButton(
              onPressed: () // async
              {
                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState.validate())
                  {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text
                    );

                    // insertToDatabase(
                    //   title:titleController.text ,
                    //   time:timeController.text ,
                    //   date:dateController.text ,
                    // ).then((value)
                    // {
                    //   grtDataFromDatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //     //   isButtonSheetShown = false;
                    //     //   febIcon = Icons.edit;
                    //     //   tasks = value;
                    //     // });
                    //   });
                    // });
                  }
                }
                else
                {
                  scaffoldKey.currentState.showBottomSheet(
                        (context) => Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            defaultFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return'title must not be empty';
                                }
                                return null;
                              },
                              label: 'Task Title',
                              prefix: Icons.title,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              onTap: ()
                              {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value)
                                {
                                  timeController.text= value.format(context).toString();
                                });
                              },
                              controller: timeController,
                              type: TextInputType.datetime,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return'time must not be empty';
                                }
                                return null;
                              },
                              label: 'Task Time',
                              prefix: Icons.watch_later_outlined,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              onTap: ()
                              {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2022-01-01'),
                                ).then((value) {
                                  dateController.text= DateFormat.yMMMd().format(value);
                                });

                              },
                              controller: dateController,
                              type: TextInputType.datetime,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return'date must not be empty';
                                }
                                return null;
                              },
                              label: 'Task Date',
                              prefix: Icons.calendar_today,
                            )
                          ],
                        ),
                      ),
                    ),
                  ).closed
                      .then((value)
                  {
                        cubit.changeBottomSheetState(
                            isShow: false,
                            icon: Icons.edit
                        );
                  });
                        cubit.changeBottomSheetState(
                            isShow: true,
                            icon: Icons.add
                  );
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',
                ),

              ],
            ),

          );
        },
      ),
    );

  }


  // Future<String> getName () async
  // {
  //   return 'mahmoud';
  // }


}











