import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool textVisible;
  
  
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textVisible, required  this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 30),
                 child: TextField(
                  controller:controller,
                  obscureText:textVisible,
                  decoration: InputDecoration(
                    enabledBorder:  const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue,width: 2),
                     borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                hintText: hintText,
                prefixIcon: Icon(icon),
                hintStyle: const TextStyle(color: Colors.black),

                  )
                 ),
                 
    );
  }
}