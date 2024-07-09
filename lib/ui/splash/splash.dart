import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweat_smart/ui/home/ui/home_screen.dart';
import 'package:sweat_smart/ui/splash/bloc/splash_bloc.dart';

import '../../other/resource.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    context.read<SplashBloc>().add(CheckIsAuthenticatedEvent());

  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state.isAuthenticated?.data==true ||state.isAuthenticated?.data!=null){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomeScreen()), (Route<dynamic> route) => false);
        }else{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              LoginScreen()), (Route<dynamic> route) => false);
        }
      },
      child: Container(
          padding: EdgeInsets.all(100),
          color: Colors.white,
          child: Image.asset("assets/images/ic_logo_gif.gif",)
      ),
    );
  }
}
