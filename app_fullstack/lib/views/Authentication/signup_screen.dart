import 'package:app_fullstack/Widgets/custom_textfiled.dart';
import 'package:app_fullstack/utils/helper_functions.dart';
import 'package:app_fullstack/views/Authentication/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phonneController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isLoading = false;

  void setLoadingOn() => setState(() => isLoading = true);
  void setLoadingOff() => setState(() => isLoading = false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_add_alt_1,
                    size: 80, color: Colors.blueAccent),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to Signup!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller1: emailController,
                          label: 'Email',
                          hintText: "Enter Your Email",
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller1: passwordController,
                          label: 'Password',
                          hintText: "Enter Your Password",
                          icon: Icons.lock,
                        isShow: true, // activates toggle icon
                        ),
                            const SizedBox(height: 20),
                           CustomTextField(
                          controller1: nameController,
                          label: 'Name',
                          hintText: "Enter Your Name",
                          icon: Icons.email,
                        ),
                            const SizedBox(height: 20),
                           CustomTextField(
                          controller1: addressController,
                          label: 'Address',
                          hintText: "Enter Your Address",
                          icon: Icons.email,
                        ),
                            const SizedBox(height: 20),
                           CustomTextField(
                          controller1: phonneController,
                          label: 'Phone Number',
                          hintText: "Enter Your Phone Number",
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
          HelperFunctions.userSignup(
            context: context,
            formKey: formkey,
            emailController: emailController,
            passwordController: passwordController,
            nameController: nameController,
            addressController: addressController,
            phonneController: phonneController,
            setLoadingOn: () => setState(() => isLoading = true),
            setLoadingOff: () => setState(() => isLoading = false),
          );
        },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: isLoading
      ? const CircularProgressIndicator(color: Colors.white)
      : const Text(
          "Signup",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
),

                        ),
                        const SizedBox(height: 10),
                       TextButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  },
  child: RichText(
    text: TextSpan(
      children: [
        const TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        const TextSpan(
          text: "Login",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ],
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
