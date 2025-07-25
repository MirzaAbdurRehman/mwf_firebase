import 'dart:async';
import 'package:app_fullstack/views/Authentication/loginScreen.dart';
import 'package:app_fullstack/views/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userEmail = prefs.getString('email');
    return userEmail;
  }


  @override
  void initState() {


    getUser().then((value) => {
      if(value != null){                                       
        Timer(const Duration(milliseconds: 2000), (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
        })
      }else{
        Timer(const Duration(microseconds: 2000), (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen() ));
        })
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('This is Splash Screen'),
          )
        ],
      ),
    );
  }
}