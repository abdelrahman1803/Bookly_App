import 'package:bookly_app/features/home/UI/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_deatails_app_bar.dart';
import 'package:bookly_app/features/home/UI/views/widgets/similar_books_section.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(book: book),
              const SizedBox(height: 16),
              const SimilarBooksSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
