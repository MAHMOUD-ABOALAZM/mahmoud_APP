import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_frist_project/modules/counter_app/counter/cubit/cubit.dart';
import 'package:my_frist_project/modules/counter_app/counter/cubit/states.dart';


class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit , CounterStates>(
        listener: (context , state) {
          if (state is CounterMinusState)
          {
            //print('minus state ${state.counter}');
          }
          if (state is CounterPlusState)
          {
            //print('plus state ${state.counter}');
          }
        },
        builder: (context , state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
                style: TextStyle(
                  fontSize:25,
                ),

              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'Minus',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'plus',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}











