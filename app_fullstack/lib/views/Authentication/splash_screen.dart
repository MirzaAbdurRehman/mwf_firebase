import 'dart:async';
import 'package:app_fullstack/views/Authentication/loginScreen.dart';
import 'package:app_fullstack/views/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        Timer(const Duration(milliseconds: 2000), (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen() ));
        })
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea (
        child:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.99,
                  width: MediaQuery.of(context).size.width * 0.99,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Lottie.asset(
                        'assets/animation/register.json',
                        repeat: true,
                        reverse: true,
                      ),
                      Text('E-Commerce',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}