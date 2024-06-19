import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sweat_smart/ui/home/ui/home_screen.dart';
import 'package:sweat_smart/ui/login/bloc/login_bloc.dart';
import 'package:sweat_smart/ui/login/bloc/login_event.dart';
import 'package:sweat_smart/ui/login/bloc/login_state.dart';
import 'package:sweat_smart/ui/register/registration_screen.dart';

import '../../other/general_utils.dart';
import '../../other/resource.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController(text:"princeish07@gmail.com");
  TextEditingController passwordCtrl = TextEditingController(text:"12345678");

  List<HealthDataAccess> get permission =>
      dataTypeKeysAndroid.map((e) => HealthDataAccess.READ).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state.loginUserModel?.status.name == Status.FAILURE.name) {
      showToast(state.loginUserModel!.message.toString(), context);

    }
    else       if (state.loginUserModel?.status.name == Status.SUCCESS.name) {
      showToast("Logged In Successfully", context);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()),(Route<dynamic> route) => false);

    }
      },
        child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.loginUserModel?.status.name == Status.LOADING.name) {
            return  Container(
                child: Center(
                    child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
              color: Colors.red,
            )));
          }
          else {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextField(
                    controller: emailCtrl,
                    decoration: InputDecoration(hintText: "Please enter email"),
                  ),
                  const SizedBox(height: 20.0),
                   TextField(
                    controller: passwordCtrl,
                    decoration:
                        InputDecoration(hintText: "Please enter password"),
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      // Dispatch the LoggedInEvent when the login button is pressed
                      context.read<LoginBloc>().add(LoggedInEvent(email: emailCtrl.text,password: passwordCtrl.text));
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 20.0),

                  InkWell(onTap:() async {
                    await Permission.activityRecognition.request();
                    await Permission.location.request();



                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                  },child: Text("Sign up"))
                ],
              ),
            );
          }
        },
      ),
),
    );
  }
}
