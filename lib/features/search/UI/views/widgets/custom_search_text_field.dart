import 'dart:async';

import 'package:bookly_app/features/search/UI/view%20models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController controller = TextEditingController();
  Timer? debounce;

  @override
  void dispose() {
    debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (value.trim().isEmpty) {
          context.read<SearchCubit>().resetSearch();
          return;
        }
        if (value.trim().length < 3) return;

        debounce?.cancel();
        debounce = Timer(const Duration(milliseconds: 500), () {
          context.read<SearchCubit>().fetchSearchBooks(title: value);
        });
      },
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: "Search...",
        suffixIcon: IconButton(
          onPressed: () {
            context.read<SearchCubit>().fetchSearchBooks(
              title: controller.text,
            );
          },
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
