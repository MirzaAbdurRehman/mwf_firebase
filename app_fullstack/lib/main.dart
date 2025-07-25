import 'package:app_fullstack/views/Authentication/signup_screen.dart';
import 'package:app_fullstack/views/Authentication/splash_screen.dart';
import 'package:app_fullstack/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAeGilFufAhX4KpDoA9KcEfkfr7q5VNrko",
          authDomain: "appstack-d5278.firebaseapp.com",
          projectId: "appstack-d5278",
          storageBucket: "appstack-d5278.firebasestorage.app",
          messagingSenderId: "88003743255",
          appId: "1:88003743255:web:793b96b1a8eb61e9415652",
          measurementId: "G-9EZZP5LJC3"
           ),
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}

