import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: "Search...",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.deepPurpleAccent,
            size: 20,
          ),
        ),
        filled: true,
        fillColor: Colors.deepPurpleAccent[50],
        labelText: "Search",
        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(5.5),
    );
  }
}
