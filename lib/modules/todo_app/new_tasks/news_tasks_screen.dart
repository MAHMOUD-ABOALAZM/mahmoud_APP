import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_frist_project/shared/components/components.dart';
import 'package:my_frist_project/shared/components/constants.dart';
import 'package:my_frist_project/shared/cubit/cubit.dart';
import 'package:my_frist_project/shared/cubit/states.dart';

class NewsTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
   
    return  BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state)
      {
        var tasks = AppCubit.get(context).newTasks;

        return tasksBuilder(
          tasks: tasks,
        );
      },
    );
  }
}
