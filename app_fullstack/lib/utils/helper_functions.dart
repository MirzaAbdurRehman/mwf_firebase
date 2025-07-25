import 'package:app_fullstack/views/Authentication/loginScreen.dart';
import 'package:app_fullstack/views/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HelperFunctions {
  static Future<void> userSignup({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required VoidCallback setLoadingOn,
    required VoidCallback setLoadingOff,
  }) async {
    if (formKey.currentState!.validate()) {
      setLoadingOn();

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Signup successful!', style: TextStyle(color: Colors.white)),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Signup Error: ${e.message}', style: TextStyle(color: Colors.white)),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setLoadingOff();
      }
    }
  }

  static Future<void> userLogin({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required VoidCallback setLoadingOn,
    required VoidCallback setLoadingOff,
  }) async {
    if (formKey.currentState!.validate()) {
      setLoadingOn();

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );


        SharedPreferences prefs = await SharedPreferences.getInstance();  //  Storing User Data locally
        await prefs.setString('email', emailController.text.trim());
      

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Login successful!', style: TextStyle(color: Colors.white)),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Login Error: ${e.message}', style: TextStyle(color: Colors.white)),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setLoadingOff();
      }
    }
  }

  static Future<void> resetPassword({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required VoidCallback setLoadingOn,
    required VoidCallback setLoadingOff,
  }) async {
    if (formKey.currentState!.validate()) {
      setLoadingOn();

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Password reset email sent!', style: TextStyle(color: Colors.white)),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error: ${e.message}', style: TextStyle(color: Colors.white)),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unexpected error: $e')),
        );
      } finally {
        setLoadingOff();
      }
    }
  }
}
