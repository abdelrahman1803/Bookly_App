import 'package:bookly_app/constats.dart';
import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/UI/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_deatails_app_bar.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/UI/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const CustomBookItem(),
        ),
        const SizedBox(height: 30),
        const Text("The Jungle Book", style: Styles.textStyle30),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Writer Name",
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 10),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 30),
        const BooksAction(),
        const SizedBox(height: 30),
        Padding(
          padding: kPaddingSH16,
          child: Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              "You may also like",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w900),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SimilarBooksListView(),
      ],
    );
  }
}
