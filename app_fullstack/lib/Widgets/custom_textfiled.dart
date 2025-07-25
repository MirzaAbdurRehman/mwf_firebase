import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  
  final TextEditingController controller1;
  final bool isShow;
  final String label;
  final String hintText;
  final IconData icon;


  const CustomTextField({

    required this.controller1,
     this.isShow = false,
    required this.label,
    required this.hintText,
    required this.icon,

  });

  @override
  Widget build(BuildContext context) {
   return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0),

    child: TextFormField(
      controller: controller1,
      obscureText: isShow,
      decoration: InputDecoration(

        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(
          icon, color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          )
        ),
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (value) {
        if(value == null || value.isEmpty){
          return 'Please enter your $label';
        }
        return null;
      },
    ),
    );
  }
}