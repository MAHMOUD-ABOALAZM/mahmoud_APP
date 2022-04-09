import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_frist_project/modules/attendance_app/home_screen/home_screen.dart';
import 'package:my_frist_project/modules/attendance_app/login_screen/cubit/cubit.dart';
import 'package:my_frist_project/modules/attendance_app/login_screen/cubit/state.dart';
import 'package:my_frist_project/shared/components/components.dart';

class AttendanceLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit ,LoginStates>(
        listener: (context , state) {} ,
        builder: (context , state) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/back.jpeg',
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your email address';
                                }
                              },
                              label: 'Email Address',
                              prefix: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              isPassword: LoginCubit.get(context).isPassword,
                              suffix: LoginCubit.get(context).suffix,
                              suffixPressed: ()
                              {
                                LoginCubit.get(context).changePasswordVisibility();
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'password is too short';
                                }
                              },
                              label: 'Password',
                              prefix: Icons.lock_outline,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultButton(
                              function: ()
                              {
                                if(formKey.currentState.validate())
                                {
                                  navigateTo(context, AttendanceHomeScreen());
                                }
                              },
                              text: 'login',
                              isUpperCase: true,
                              background: Colors.blue.withOpacity(.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } ,
      ),
    );
  }
}
