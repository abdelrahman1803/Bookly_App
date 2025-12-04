import 'package:bookly_app/features/home/UI/views/widgets/custom_book_deatails_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CustomBookDetailsAppBar()]);
  }
}
