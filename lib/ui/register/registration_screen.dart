import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sweat_smart/other/general_utils.dart';
import 'package:sweat_smart/ui/login/bloc/login_bloc.dart';
import 'package:sweat_smart/ui/login/bloc/login_event.dart';
import 'package:sweat_smart/ui/login/bloc/login_state.dart';
import 'package:sweat_smart/ui/register/bloc/register_state.dart';
import 'package:sweat_smart/ui/register/registration_screen.dart';
import 'package:toastification/toastification.dart';

import '../../other/resource.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController userNameCtrl = TextEditingController(text: "");
  TextEditingController phoneCtrl = TextEditingController(text: "");

  TextEditingController emailCtrl = TextEditingController(text: "");
  TextEditingController passwordCtrl = TextEditingController(text: "");
  TextEditingController confirmPasswordCtrl = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.registrationResponse?.status.name == Status.FAILURE.name) {
            showToast(state.registrationResponse!.message.toString(), context);

          }
          else       if (state.registrationResponse?.status.name == Status.SUCCESS.name) {
            showToast("Registered Successfully", context);

          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state.registrationResponse?.status.name == Status.LOADING.name) {
              return  Container(
                  child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.cyan,
                        color: Colors.red,
                      )));
            }
            else {
              return Center(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          controller: userNameCtrl,
                          decoration: InputDecoration(hintText: "Please enter user name"),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: emailCtrl,
                          decoration: InputDecoration(hintText: "Please enter email"),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: phoneCtrl,
                          decoration: InputDecoration(hintText: "Please enter phone"),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: passwordCtrl,
                          decoration:
                          InputDecoration(hintText: "Please enter password"),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: confirmPasswordCtrl,
                          decoration:
                          InputDecoration(hintText: "Please enter confirm password"),
                        ),
                        const SizedBox(height: 40.0),
                        ElevatedButton(
                          onPressed: () {
                            // Fluttertoast.showToast(
                            //     msg: "This is Center Short Toast",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0
                            // );
                            // Dispatch the LoggedInEvent when the login button is pressed
                            context.read<RegisterBloc>().add(RegisterButtonClickEvent(email: emailCtrl.text,userName: userNameCtrl.text,phone: phoneCtrl.text,password: passwordCtrl.text,confirmPassword: confirmPasswordCtrl.text));
                          },
                          child: const Text("Register"),
                        ),
                        const SizedBox(height: 20.0),

                        InkWell(onTap:(){
                          Navigator.pop(context);
                        },child: Text("Login"))
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
