import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller1;
  final bool isShow; // true if it's a password field
  final String label;
  final String hintText;
  final IconData icon;

  const CustomTextField({
    Key? key,
    required this.controller1,
    this.isShow = false,
    required this.label,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isShow;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: widget.controller1,
        obscureText: widget.isShow ? _obscureText : false,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon, color: Colors.blue),
          suffixIcon: widget.isShow
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your ${widget.label}';
          }
          return null;
        },
      ),
    );
  }
}
