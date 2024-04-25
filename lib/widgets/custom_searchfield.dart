import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  // final Function(String) onSubmitted;

  const CustomSearchTextField({
    required this.controller,
    // required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search location...',
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      // onSubmitted: onSubmitted,
    );
  }
}
