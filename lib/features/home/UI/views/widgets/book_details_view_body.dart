import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_deatails_app_bar.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const CustomBookItem(),
        ),
        const SizedBox(height: 30),
        const Text("The Jungle Book", style: Styles.textStyle30),
        const Text("Writer Name", style: Styles.textStyle18),
        const SizedBox(height: 20),
        const BookRating(),
      ],
    );
  }
}
