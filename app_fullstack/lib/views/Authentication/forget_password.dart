import 'package:app_fullstack/Widgets/custom_textfiled.dart';
import 'package:app_fullstack/utils/helper_functions.dart';
import 'package:app_fullstack/views/Authentication/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForegetScreen extends StatefulWidget {
  const ForegetScreen({super.key});

  @override
  State<ForegetScreen> createState() => _ForegetScreenState();
}

class _ForegetScreenState extends State<ForegetScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;


  void setLoadingOn() => setState(() => isLoading = true);
  void setLoadingOff() => setState(() => isLoading = false);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }
        , icon: Icon(Icons.arrow_back)),

        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_reset,
                    size: 80, color: Colors.blueAccent),
                const SizedBox(height: 16),
                const Text(
                  'Reset your password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Enter your email and we’ll send you a link to reset your password.',
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller1: emailController,
                          label: 'Email',
                          hintText: "Enter your email",
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    HelperFunctions.resetPassword(
                                      context: context,
                                      formKey: formKey,
                                      emailController: emailController,
                                      setLoadingOn: setLoadingOn,
                                      setLoadingOff: setLoadingOff,
                                    );
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text(
                                    "Send Reset Link",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            "Back to Login",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
