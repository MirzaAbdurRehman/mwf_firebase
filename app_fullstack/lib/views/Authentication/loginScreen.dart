import 'package:app_fullstack/Widgets/custom_textfiled.dart';
import 'package:app_fullstack/utils/helper_functions.dart';
import 'package:app_fullstack/views/Authentication/forget_password.dart';
import 'package:app_fullstack/views/Authentication/signup_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void setLoadingOn() => setState(() => isLoading = true);
  void setLoadingOff() => setState(() => isLoading = false);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_reset, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForegetScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Icon(Icons.lock_person_rounded, size: 80, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller1: emailController,
                        label: 'Email',
                        hintText: "Enter your email",
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller1: passwordController,
                        label: 'Password',
                        hintText: "Enter your password",
                        icon: Icons.lock,
                        isShow: true, 
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child:
                        
                         ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    HelperFunctions.userLogin(
                      context: context,
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      setLoadingOn: () => setState(() => isLoading = true),
                      setLoadingOff: () => setState(() => isLoading = false),
                    );
                  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                        ),


                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {

                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SignupScreen()));
                          // Replace with actual SignUp screen navigation
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Go to Sign Up screen")),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
