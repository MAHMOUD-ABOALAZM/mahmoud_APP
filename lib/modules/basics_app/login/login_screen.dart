import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_frist_project/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var  formKey= GlobalKey<FormState>();
  var suffix;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    var suffix;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children:[
                  Text(
                    'Login',
                    style:TextStyle(
                      fontSize: 40.0,
                      fontWeight:FontWeight.bold,

                    ) ,
                  ),
                  SizedBox(

                    height: 40.0,
                  ),
                  TextFormField(
                     controller:emailController,
                     keyboardType:TextInputType.emailAddress,
                     obscureText: true,
                     onFieldSubmitted:(String value)
                     {
                            print(value);
                     } ,
                     onChanged: (String value)
                     {
                      print(value);
                     },
                     validator: (value)
                     {
                       if(value.isEmpty)
                       {
                         return'email must not be empty';
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                       labelText: ('email'),
                       border:OutlineInputBorder(),
                       prefixIcon: Icon(
                         Icons.email,
                       ),

                     ),
                   ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller:passwordController,
                    keyboardType:TextInputType.visiblePassword,
                    obscureText: isPassword,
                    onFieldSubmitted:(String value)
                    {
                      print(value);
                    } ,
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value.isEmpty)
                      {
                        return'password must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: ('password'),
                      border:OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon:IconButton(
                        icon: isPassword ? Icon(
                          Icons.visibility,
                        ) :Icon(
                          Icons.visibility_off,
                        ),
                        onPressed: ()
                      { setState(() {
                          isPassword=! isPassword;
                        });
                      },
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaultButton(
                    function: ()
                    {
                      if(formKey.currentState.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children:[
                        Text
                          (
                          'Don\t  have an account ?',
                        ),
                        TextButton(onPressed:(){}, child: Text(
                          ' Register now',
                        ),),
                      ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}